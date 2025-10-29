# syntax=docker/dockerfile:1.4
FROM swift:6.1 AS builder

WORKDIR /workspace
COPY . .

# Build the static library
RUN swift build -c release