# 基础镜像
FROM golang:1.16.4

# 支持中文
ENV LANF C.UTF-8

# 声明需要开放的端口
EXPOSE 8080

# 时区
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && echo 'Asia/Shanghai' >/etc/timezone

RUN mkdir /tekton_test

COPY . /tekton_test

WORKDIR /tekton_test

RUN export GOPROXY=https://goproxy.io && go build

ENTRYPOINT ["./tekton_test"]