FROM ubuntu:16.04

# setup dependencies 
RUN apt-get update
RUN apt-get install -y build-essential
RUN apt-get install -y doxygen 
RUN apt-get install -y git python
RUN apt-get install -y cmake-curses-gui  vim
RUN apt-get install -y exuberant-ctags
RUN apt-get install -y libxt-dev libgl1-mesa-glx libgl1-mesa-dev libglapi-mesa libosmesa-dev 

# install 
RUN mkdir /opt/vmtk
WORKDIR /opt/vmtk

RUN git clone https://github.com/vmtk/vmtk.git vmtk-1.4
WORKDIR /opt/vmtk/vmtk-1.4
RUN git checkout tags/v1.4.0 -b v1.4.0

WORKDIR /opt/vmtk/vmtk-build
RUN apt-get install -y libpython-dev python-dev
RUN cmake -DCMAKE_VERBOSE_MAKEFILE=ON -DGIT_PROTOCOL_HTTPS=ON ../vmtk-1.4
RUN make -j 4 2>&1 | tee build.log

