FROM python:3.9.5-alpine

# Install essetial dependencies
RUN apk --no-cache add g++ make pango libffi-dev zlib-dev jpeg-dev fontconfig

# Install microsoft general fonts
# this package install many fonts: https://packages.debian.org/sid/ttf-mscorefonts-installer
#RUN apk add --no-cache msttcorefonts-installer
#RUN update-ms-fonts

# Install main app - markdown2pdf
RUN pip install markdown2pdf

# Install custom fonts
COPY fonts/* /usr/share/fonts/
RUN fc-cache -fv

# Fix markdown2pdf syntax error
RUN sed -i "s/print css_file/print(css_file)/g" /usr/local/lib/python3.9/site-packages/markdown2pdf/__init__.py

