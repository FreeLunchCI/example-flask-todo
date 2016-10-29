#
# example flask todo app.
#

# https://hub.docker.com/_/alpine/
FROM alpine:edge
MAINTAINER drad "drader@adercon.com"

# basic flask environment
RUN apk add --no-cache bash git python3 \
    && python3 -m ensurepip \
    && rm -r /usr/lib/python*/ensurepip \
    && pip3 install --upgrade pip \
    && pip3 install flask \
    && ln -s -T /usr/bin/python3 /usr/bin/python


# the app dir
ENV APP_DIR /app
RUN mkdir ${APP_DIR}
VOLUME ["${APP_DIR}"]
WORKDIR ${APP_DIR}


# expose web server port
EXPOSE 3000

# copy config files into filesystem
COPY requirements.txt /requirements.txt

# install project requirements
RUN pip3 install -r /requirements.txt


# exectute start up script
CMD /entrypoint.sh -d
ENTRYPOINT ["python", "todo.py"]
