# ADR 0003 — Vercel Serverless Proxy

## Status

Accepted

## Context

The OWM API key must not be exposed in the client app. A proxy layer is needed to protect the key, cache shared location data, and enforce per-user rate limiting.

## Decision

Use a Vercel serverless function (Node.js) as a proxy between the app and OWM. Use Vercel KV for caching and rate limiting.

## Consequences

- OWM API key never exposed to the client
- Shared location cache reduces OWM calls when multiple users request the same coords
- Vercel free tier supports ~4,761 users before upgrade needed (1M invocations/month)
- Single endpoint: api/uv.js
- Proxy repo is separate from the Flutter app repo (uvwatch-proxy)
