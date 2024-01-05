# Texlive-Sphinx docker image

[![GitHub sjtuhpc/texlive-sphinx](https://img.shields.io/badge/GitHub-sjtuhpc%2Ftexlive--sphinx-informational)](https://github.com/sjtuhpc/texlive-sphinx)
[![Docker Hub sjtuhpc/texlive-sphinx](https://img.shields.io/badge/Docker_Hub-sjtuhpc%2Ftexlive---informational.svg)](https://hub.docker.com/r/sjtuhpc/texlive-sphinx)
![Docker Pulls](https://img.shields.io/docker/pulls/sjtuhpc/texlive-sphinx)

![Docker Cloud Automated build](https://img.shields.io/docker/cloud/automated/sjtuhpc/texlive-sphinx)
[![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/sjtuhpc/texlive-sphinx)](https://hub.docker.com/r/sjtuhpc/texlive-sphinx/builds)

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
