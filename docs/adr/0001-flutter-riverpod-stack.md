# ADR 0001 — Flutter + Riverpod Stack

## Status

Accepted

## Context

UV Alert targets Android and iOS from a single codebase. The developer works on Linux/Arch with an Android/Pixel device. A cross-platform solution was required to avoid maintaining two separate native codebases.

## Decision

Use Flutter for the UI framework and Riverpod for state management.

## Consequences

- Single codebase for Android and iOS
- Riverpod provides compile-safe, testable state management
- iOS builds require a cloud Mac solution (Codemagic) due to Linux-only dev environment
- No Linux/desktop support — Flutter desktop targets explicitly excluded
