FROM golang:1.22-alpine AS gobuild
WORKDIR /build
COPY gorelay/ ./
RUN CGO_ENABLED=0 go build -o /gorelay .

FROM python:3.11-slim
WORKDIR /app

RUN apt-get update && apt-get install -y --no-install-recommends curl unzip && rm -rf /var/lib/apt/lists/*

RUN curl -L -o /tmp/xray.zip https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip && \
    unzip /tmp/xray.zip -d /usr/local/bin/ && \
    chmod +x /usr/local/bin/xray && \
    rm /tmp/xray.zip

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY --from=gobuild /gorelay /usr/local/bin/gorelay
COPY *.py ./
COPY xray_config.json /app/xray_config.json
COPY start.sh /app/start.sh
RUN chmod +x /app/start.sh

ENV DATA_DIR=/data
RUN mkdir -p /data

EXPOSE 8000 443

CMD ["/app/start.sh"]
