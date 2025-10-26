FROM swift:6.1 as builder
WORKDIR /workspace
COPY . .
RUN swift build -c release