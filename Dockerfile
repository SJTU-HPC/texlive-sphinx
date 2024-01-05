# Use ubuntu jammy as parent image
FROM ubuntu:jammy
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
RUN fc-cache -fv
RUN apt-get clean
RUN DEBIAN_FRONTEND=noninteractive apt-get install -qy pdftk
RUN rm -rf /var/lib/apt/lists/* 
