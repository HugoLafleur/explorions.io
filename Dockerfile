FROM golang:latest
MAINTAINER Hugo Lafleur hugo.lafleur@gmail.com
RUN go get -u -v github.com/spf13/hugo
RUN hugo new site /blog

# Install & configure AWS CLI
RUN wget https://bootstrap.pypa.io/get-pip.py && python ./get-pip.py && pip install awscli

ENV AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID
ENV AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY
ENV AWS_DEFAULT_REGION=$AWS_DEFAULT_REGION

ADD . /blog
WORKDIR /blog
RUN hugo --buildDrafts=true

CMD [ "aws", "s3", "sync", "public/", "s3://explorions.io/", "--delete", "--dryrun" ]