FROM golang:1.22-alpine As builder

WORKDIR /usr/src/app

COPY . .

RUN go mod download

RUN go build -o product-catalog ./

FROM alpine as release

WORKDIR /usr/src/app

COPY ./products ./products
COPY --from=builder /usr/src/app/product-catalog ./

EXPOSE ${PRODUCT_CATALOG_PORT}
ENV PRODUCT_CATALOG_PORT 8088
ENTRYPOINT ["./product-catalog"]
