FROM ubuntu:14.04

RUN apt-get update;
RUN apt-get install -y \
	build-essential libyaml-dev \
	libfftw3-dev python-dev \
	libsamplerate0-dev libtag1-dev

RUN apt-get install -y libavcodec-dev libavformat-dev

RUN apt-get install -y python-numpy-dev python-numpy python-yaml

ADD https://github.com/MTG/essentia/archive/v2.1_beta2.tar.gz /tmp/essentia.tar.gz

RUN cd tmp; \
  tar -xvf essentia.tar.gz; \
  cd essentia-2.1_beta2; \
  ./waf configure --mode=release --with-python; \
  ./waf; \
  ./waf install; \
  cd ..; \
  rm -R essentia-2.1_beta2; \
  rm essentia.tar.gz

