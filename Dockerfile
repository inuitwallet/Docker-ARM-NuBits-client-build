FROM mazzolino/armhf-ubuntu:12.04

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y git gcc build-essential libssl-dev libcurl4-openssl-dev libdb-dev libdb++-dev libboost-all-dev
RUN git clone https://mj2p@bitbucket.org/JordanLeePeershares/nubit.git
WORKDIR /nubit/src
RUN sed -i 's/USE_UPNP:=0/USE_UPNP:=-\nSTATIC=all/' makefile.unix
RUN make -f makefile.unix
