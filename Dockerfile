# Use the official Golang image as the base image
FROM golang:1.18

# Set the current working directory inside the container
WORKDIR /app

# Copy go.mod and go.sum files first to enable layer caching
COPY go.mod go.sum ./

# Download and cache Go modules
RUN go mod download

# Copy the rest of the application code
COPY . .

# Build the Go application
RUN go build -o main .

# Expose the port the application runs on
EXPOSE 8080

# Run the executable
CMD ["./main"]
