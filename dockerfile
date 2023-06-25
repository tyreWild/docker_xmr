FROM ubuntu

ENV WALLET=$WALLET
# ENV POOL=xmrpool.eu:5555
ENV POOL=pool.supportxmr.com:3333
ENV PASSWORD=tyree

WORKDIR RIG

RUN apt update -y 
RUN apt install wget -y
RUN wget https://github.com/xmrig/xmrig/releases/download/v6.19.3/xmrig-6.19.3-linux-static-x64.tar.gz

RUN tar -xvf xmrig-6.19.3-linux-static-x64.tar.gz
RUN cp -r xmrig-6.19.3/* ./

RUN sysctl -w vm.nr_hugepages=1168

COPY ./entrypoint.sh .
RUN chmod +x ./entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]
