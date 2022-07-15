# Use ubuntu focal as parent image
FROM ubuntu:focal
# Set maintainer
LABEL maintainer="Jianwen Wei <weijianwen@sjtu.edu.cn>"

# Set the working directory to /app
WORKDIR /data
VOLUME /data

# Update and install texlive-full
RUN apt-get update -q
RUN DEBIAN_FRONTEND=noninteractive apt-get install -qy texlive-full make git openjdk-8-jre-headless rubber scons python3-pip wget rsync pandoc
RUN pip3 install beautifulsoup4 css_html_js_minify ipykernel jupyter_client lxml matplotlib nbconvert nbsphinx notebook numpy numpydoc pandas python-slugify[unidecode] recommonmark sphinx-copybutton sphinx sphinx_markdown_tables sphinx_material Sphinx-Substitution-Extensions jieba
RUN wget https://cs.fit.edu/code/projects/ndworld/repository/revisions/12/raw/Resources/Fonts/AdobeSongStd-Light.otf -O /usr/share/fonts/opentype/AdobeSongStd-Light.otf
RUN wget https://cs.fit.edu/code/projects/ndworld/repository/revisions/12/raw/Resources/Fonts/AdobeHeitiStd-Regular.otf -O /usr/share/fonts/opentype/AdobeHeitiStd-Regular.otf
RUN wget https://cs.fit.edu/code/projects/ndworld/repository/revisions/12/raw/Resources/Fonts/AdobeKaitiStd-Regular.otf -O /usr/share/fonts/opentype/AdobeKaitiStd-Regular.otf
RUN wget https://cs.fit.edu/code/projects/ndworld/repository/revisions/12/raw/Resources/Fonts/AdobeMingStd-Light.otf -O /usr/share/fonts/opentype/AdobeMingStd-Regular.otf
RUN wget https://cs.fit.edu/code/projects/ndworld/repository/revisions/12/raw/Resources/Fonts/AdobeFangsongStd-Regular.otf -O /usr/share/fonts/opentype/AdobeFangsongStd-Regular.otf
RUN wget https://raw.githubusercontent.com/StellarCN/scp_zh/master/fonts/SimKai.ttf -O /usr/share/fonts/opentype/SimKai.ttf
RUN wget https://raw.githubusercontent.com/StellarCN/scp_zh/master/fonts/SimHei.ttf -O /usr/share/fonts/opentype/SimHei.ttf
RUN wget https://raw.githubusercontent.com/StellarCN/scp_zh/master/fonts/SimSun.ttf -O /usr/share/fonts/opentype/SimSun.ttf
RUN wget https://raw.githubusercontent.com/Halfish/lstm-ctc-ocr/master/fonts/simfang.ttf -O /usr/share/fonts/opentype/SimFang.ttf
RUN wget https://raw.githubusercontent.com/kashyapmanu/Microsoft-Fonts/master/times.ttf -O /usr/share/fonts/opentype/times.ttf
RUN wget https://raw.githubusercontent.com/kashyapmanu/Microsoft-Fonts/master/timesbd.ttf -O /usr/share/fonts/opentype/timesbd.ttf
RUN wget https://raw.githubusercontent.com/kashyapmanu/Microsoft-Fonts/master/timesbi.ttf -O /usr/share/fonts/opentype/timesbi.ttf
RUN wget https://raw.githubusercontent.com/kashyapmanu/Microsoft-Fonts/master/timesi.ttf -O /usr/share/fonts/opentype/timesi.ttf
RUN fc-cache -fv
RUN apt-get clean
RUN DEBIAN_FRONTEND=noninteractive apt-get install -qy pdftk
RUN rm -rf /var/lib/apt/lists/* 
