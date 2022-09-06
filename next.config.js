/** @type {import('next').NextConfig} */
const nextConfig = {
  reactStrictMode: true,
  swcMinify: true,
  poweredByHeader: false,
  output: "standalone",
  experimental: {
    legacyBrowsers: false,
    browsersListForSwc: true,
  },
};

module.exports = nextConfig;
