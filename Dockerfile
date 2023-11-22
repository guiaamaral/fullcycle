FROM golang:alpine as builder
WORKDIR /app
COPY go.mod main.go ./
RUN go mod tidy \
    && go build

FROM scratch
WORKDIR /app
COPY --from=builder /app/fullcycle .
CMD ["./fullcycle"]