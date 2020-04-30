FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y wget git cmake pybind11-dev rapidjson-dev && \
    apt-get install -y libcurl4-openssl-dev libblkid-dev e2fslibs-dev  && \
    apt-get install -y libboost-all-dev libaudit-dev software-properties-common

RUN wget -q https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb && \
    apt-get install ./packages-microsoft-prod.deb

RUN apt update
RUN apt install -y apt-transport-https
RUN apt-get update && apt-get install -y dotnet-sdk-3.1

RUN mkdir /cppKin
COPY CMakeLists.txt /cppKin
COPY IDL/ /cppKin/IDL/
COPY LICENSE /cppKin
COPY MANIFEST.in /cppKin
COPY README.md /cppKin
COPY Third_Party/ /cppKin/Third_Party
COPY appveyor.yml /cppKin
COPY bench/ /cppKin/bench
COPY cmake/ /cppKin/cmake
COPY cppkin/ /cppKin/cppkin
COPY cppkin.bat /cppKin
COPY cppkin.sh /cppKin
COPY docs/ /cppKin/docs
COPY examples/ /cppKin/examples
COPY scripts/ /scripts
COPY setup.py /cppKin
COPY src/ /cppKin/src
COPY tests/ /cppKin/tests

RUN cd cppKin && mkdir build && cd build && ../cppkin.sh config --output_dir=/usr/local --3rd_loc_prefix=/usr/local --with_examples && make && make install
