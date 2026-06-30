FROM debian:12 AS build
RUN <<EOF
apt-get update
apt-get install -y build-essential
EOF
COPY . /src
RUN make -C /src

FROM debian:12-slim
COPY --from=build /src/out /app
CMD ["/app"]
