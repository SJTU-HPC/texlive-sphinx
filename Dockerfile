# Use ubuntu eoan as parent image
FROM ubuntu:eoan
# Set maintainer
LABEL maintainer="Jianwen Wei <weijianwen@sjtu.edu.cn>"

# Set the working directory to /app
WORKDIR /data
VOLUME /data

# Update and install texlive-full
RUN apt-get update -q && \
    DEBIAN_FRONTEND=noninteractive apt-get install -qy texlive-full make git openjdk-8-jre-headless rubber scons python3-pip wget && \
    pip3 install beautifulsoup4 css_html_js_minify ipykernel jupyter_client lxml matplotlib nbconvert nbsphinx notebook numpy numpydoc pandas python-slugify[unidecode] recommonmark sphinx-copybutton sphinx sphinx_markdown_tables sphinx_material Sphinx-Substitution-Extensions && \
    wget https://cs.fit.edu/code/projects/ndworld/repository/revisions/12/raw/Resources/Fonts/AdobeSongStd-Light.otf -O /usr/share/fonts/opentype/AdobeSongStd-Light.otf && \
    wget https://cs.fit.edu/code/projects/ndworld/repository/revisions/12/raw/Resources/Fonts/AdobeHeitiStd-Regular.otf -O /usr/share/fonts/opentype/AdobeHeitiStd-Regular.otf && \
    fc-cache -fv && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* 
