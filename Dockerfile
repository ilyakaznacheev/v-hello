FROM buildpack-deps:buster-curl 
#alpine/git:latest

# RUN mkdir /vlib
# WORKDIR /vlib

# RUN apk add --update make
# RUN git clone https://github.com/vlang/v && cd v && make

# WORKDIR /opt/vlang
# RUN apt-get update && apt-get install -y --no-install-recommends gcc clang make git
# RUN git clone https://github.com/vlang/v
# RUN cd v && make

WORKDIR /opt/code/
ADD ./ /opt/code/

RUN apt-get update && apt-get install -y --no-install-recommends gcc clang make git libssl-dev
RUN git clone https://github.com/vlang/v
RUN cd v && make

RUN mkdir bin
RUN /opt/code/v/v -o /opt/code/bin/hello .

FROM alpine

WORKDIR /app

EXPOSE 8081

COPY --from=0 /opt/code/bin/hello /app/

ENTRYPOINT ["./hello"]
