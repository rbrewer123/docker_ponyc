# build command:
#  docker build -t rbrewer123/ponyc .

FROM ubuntu:14.04

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    clang-3.6 \
    curl \
    libncurses5-dev \
    libssl-dev \
    llvm-3.6 \
    llvm-3.6-dev \
    make \
    zlib1g-dev

ENV CC clang-3.6
ENV CXX clang++-3.6

RUN mkdir -p /usr/src

RUN curl -SL -o /usr/src/repo.tbz2 ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/pcre2-10.20.tar.bz2 && \
    tar xf /usr/src/repo.tbz2 -C /usr/src && \
    ln -s /usr/src/*pcre* /usr/src/pcre

WORKDIR /usr/src/pcre

RUN ./configure --prefix=/usr && \
    make && \
    make install

WORKDIR /

RUN curl -SL -o /usr/src/repo.tgz https://api.github.com/repos/CausalityLtd/ponyc/tarball/master && \
    tar xf /usr/src/repo.tgz -C /usr/src && \
    ln -s /usr/src/*ponyc* /usr/src/ponyc

WORKDIR /usr/src/ponyc

RUN make config=release test && \
    ./build/release/ponyc examples/helloworld && \
    ./helloworld

COPY runasuser.sh /root/
RUN chmod a+x /root/runasuser.sh
    
RUN mkdir /data

WORKDIR /data

ENTRYPOINT ["/root/runasuser.sh"]

