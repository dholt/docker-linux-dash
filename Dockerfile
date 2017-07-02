FROM alpine:latest

LABEL maintainer="Douglas Holt <dholt@nvidia.com>"

EXPOSE 8081

RUN echo nameserver 8.8.8.8 >> /etc/resolv.conf

RUN apk add --no-cache git curl unzip python && \
    git clone --depth 1 https://github.com/afaqurk/linux-dash.git && \
    cd linux-dash/app/server/ && \
    curl -LOk https://github.com/afaqurk/linux-dash/archive/master.zip && \
    unzip master.zip && \
    cd linux-dash-master/app/server && \
    python index.py --port 8081

WORKDIR "/linux-dash/app/server/linux-dash-master/app/server"

CMD ["python", "index.py", "--port", "8081"]
