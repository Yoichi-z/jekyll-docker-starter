FROM ruby:3.4.5-slim-bookworm

RUN apt-get update -y && apt-get install -y --no-install-recommends \
    build-essential git \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /site

ENV GEM_HOME=/usr/local/bundle \
    BUNDLE_PATH=/usr/local/bundle \
    BUNDLE_BIN=/usr/local/bundle/bin \
    PATH="/usr/local/bundle/bin:${PATH}"

RUN echo 'gem: --no-document' >> /usr/local/etc/gemrc

COPY docker/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

EXPOSE 4000 35729
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]