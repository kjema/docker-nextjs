FROM node:alpine AS builder
RUN apk update

# Set working directory
WORKDIR /app

RUN npm i -g pnpm turbo

COPY *.json .
COPY pnpm-*.yaml .
COPY apps/docker-nextjs/src ./apps/docker-nextjs/src
COPY apps/docker-nextjs/public ./apps/docker-nextjs/public
COPY apps/docker-nextjs/next.config.js ./apps/docker-nextjs
COPY apps/docker-nextjs/package.json ./apps/docker-nextjs
COPY apps/docker-nextjs/tsconfig.json ./apps/docker-nextjs

COPY packages ./packages

RUN pnpm install

# Build the project
RUN pnpm turbo run build --filter=docker-nextjs

FROM node:alpine AS runner
WORKDIR /app

# Don't run production as root
RUN addgroup --system --gid 1001 nodejs
RUN adduser --system --uid 1001 nextjs
USER nextjs

COPY --from=builder /app/apps/docker-nextjs/public ./public

# Automatically leverage output traces to reduce image size 
# https://nextjs.org/docs/advanced-features/output-file-tracing
COPY --from=builder --chown=nextjs:nodejs /app/apps/docker-nextjs/.next/standalone .
COPY --from=builder --chown=nextjs:nodejs /app/apps/docker-nextjs/.next/static ./apps/docker-nextjs/.next/static

CMD node apps/docker-nextjs/server.js
