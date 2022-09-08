const withTM = require("next-transpile-modules")(["ui"]);
const path = require("path");

/** @type {import('next').NextConfig} */
const nextConfig = {
  reactStrictMode: true,
  swcMinify: true,
  poweredByHeader: false,
  output: "standalone",
  experimental: {
    legacyBrowsers: false,
    browsersListForSwc: true,
    outputFileTracingRoot: path.join(__dirname, "../../"),
  },
};

module.exports = withTM(nextConfig);
