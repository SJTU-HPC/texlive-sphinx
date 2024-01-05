# Texlive-full docker image

[![GitHub laurenss/texlive-full](https://img.shields.io/badge/GitHub-laurenss%2Ftexlive--full-informational)](https://github.com/laurenss/texlive-full)
[![Docker Hub laurenss/texlive-full](https://img.shields.io/badge/Docker_Hub-laurenss%2Ftexlive--full-informational.svg)](https://hub.docker.com/r/laurenss/texlive-full)
[![Download Size](https://images.microbadger.com/badges/image/laurenss/texlive-full.svg)](https://microbadger.com/images/laurenss/texlive-full)
![Docker Pulls](https://img.shields.io/docker/pulls/laurenss/texlive-full)

![Docker Cloud Automated build](https://img.shields.io/docker/cloud/automated/laurenss/texlive-full)
[![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/laurenss/texlive-full)](https://hub.docker.com/r/laurenss/texlive-full/builds)

A docker image with texlive-full installed for LaTeX CI builds.

## Build

Build this Docker image:

    docker build . -t sjtuhpc/texlive-sphinx:latest --file Dockerfile

Optionally, push the image to docker hub:

    docerk login
    docker push sjtuhpc/texlive-sphinx:latest

## Usage

To run the container with the current working directory mounted:

    docker run --rm -it -v ${PWD}:/data sjtuhpc/texlive-sphinx:latest pdflatex filename.tex

To build [SJTU HPC Docs](https://github.com/SJTU-HPC/docs.hpc.sjtu.edu.cn) , try:

    git clone https://github.com/SJTU-HPC/docs.hpc.sjtu.edu.cn.git
    docker run --rm -it -v ${PWD}:/data sjtuhpc/texlive-sphinx:latest ack '.*raw.*html' docs
    docker run --rm -it -v ${PWD}:/data sjtuhpc/texlive-sphinx:latest make -C tex all
    docker run --rm -it -v ${PWD}:/data sjtuhpc/texlive-sphinx:latest make -C docs clean latexpdf
    docker run --rm -it -v ${PWD}:/data sjtuhpc/texlive-sphinx:latest make -C docs clean html

## Credit

LaurensS/texlive-full https://github.com/LaurensS/texlive-full
