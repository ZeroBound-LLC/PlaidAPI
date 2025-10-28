# syntax=docker/dockerfile:1.6
FROM swift:6.1-jammy as builder

WORKDIR /build
COPY . .

# Build release with static Swift stdlib
RUN swift build -c release --static-swift-stdlib

RUN mkdir -p /out && cp -R .build/release/*.a /out/

FROM ubuntu:22.04
COPY --from=builder /out /out
