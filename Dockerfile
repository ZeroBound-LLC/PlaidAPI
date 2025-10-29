# syntax=docker/dockerfile:1.4
FROM swift:6.1 AS builder

WORKDIR /workspace
COPY . .

# Build the static library
RUN swift build -c release

# Extract all static libs (.a) to /out so Buildx can copy them back
RUN mkdir -p /out && \
    find .build -type f -name "*.a" -exec cp {} /out/ \;

# Final export stage
FROM scratch AS export
COPY --from=builder /out/ /
