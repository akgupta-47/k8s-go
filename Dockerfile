# Use official Golang image as a builder
FROM golang:1.23 AS builder

# Set working directory inside container
WORKDIR /app

# Copy go.mod and go.sum
COPY go.mod ./

# Download dependencies
RUN go mod download

# Copy the rest of the source code
COPY . .

# Build statically for Alpine
RUN CGO_ENABLED=0 GOOS=linux go build -o app

# Use a lightweight image for production
FROM alpine:latest

# Set working directory in final container
WORKDIR /root/

# Copy binary from builder stage
COPY --from=builder /app/app .

RUN chmod +x ./app

# Expose application port (change if your app uses a different port)
EXPOSE 8000

# Command to run the binary
CMD ["./app"]
