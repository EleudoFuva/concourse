# Etapa de construcción
FROM golang:1.21 AS builder

WORKDIR /app
COPY . .

RUN go build -o hello-world .

# Etapa final para la imagen ligera
FROM alpine:3.18

WORKDIR /app
COPY --from=builder /app/hello-world .

CMD ["./hello-world"]
