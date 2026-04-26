# ADR 0005 — Sentry Error Tracking

## Status

Accepted

## Context

The proxy and Flutter app need visibility into errors across both layers. Manual log monitoring in Vercel dashboard is insufficient for catching and responding to issues quickly.

## Decision

Integrate Sentry on both the proxy (Node.js) and the Flutter app. Sentry logs all error codes regardless of severity or resolution. Alerts fire on first occurrence of any error.

## Consequences

- Full error history and frequency tracking across proxy and app
- Immediate alerts on critical errors (500, 502) enabling fast response
- Pattern detection (e.g. 503 spikes indicating OWM reliability issues)
- Sentry has a free tier sufficient for early-stage usage
