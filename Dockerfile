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

WORKDIR /opt/vmtk-build
