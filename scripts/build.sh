#!/bin/bash

# Get current working directory 
# echo "$PWD"


# Install dependencies
cd ..
pnpm install --frozen-lockfile

# Build
# NEXT_TELEMETRY_DISABLED=1
pnpm build

# Create dist folder
dist_folder=dist
# mkdir -p $dist_folder/apps/nextjs
mkdir -p $dist_folder

# Copy artifacts
# cp apps/nextjs/next.config.mjs $dist_folder/apps/nextjs/
# cp -r apps/nextjs/public/ $dist_folder/apps/nextjs/public
cp -ax .next/standalone/ $dist_folder/
# cp -r apps/nextjs/.next/static/ $dist_folder/apps/nextjs/.next/static