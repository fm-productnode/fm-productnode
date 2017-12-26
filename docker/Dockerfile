FROM php:7.0.24-cli

MAINTAINER franz-mue <info@fm-productnode.de>

#
# PHP
#

RUN apt-get update \
	&& apt-get install -y --no-install-recommends libicu-dev libssl-dev libzip-dev \
	&& rm -r /var/lib/apt/lists/*

RUN apt-get update \
	&& apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng12-dev \
    && docker-php-ext-install -j$(nproc) iconv mcrypt \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd

RUN docker-php-ext-install mbstring intl zip

RUN echo "memory_limit = -1" >> /usr/local/etc/php/php.ini \
	&& echo "display_errors = On" >> /usr/local/etc/php/php.ini \
	&& echo "register_argc_argv = Off" >> /usr/local/etc/php/php.ini \
	&& echo "auto_globals_jit = On" >> /usr/local/etc/php/php.ini \
	&& echo "post_max_size = 0" >> /usr/local/etc/php/php.ini \
	&& echo "allow_url_fopen = On" >> /usr/local/etc/php/php.ini \
	&& echo "allow_url_include = Off" >> /usr/local/etc/php/php.ini \
	&& echo "short_open_tag = Off" >> /usr/local/etc/php/php.ini \
	&& echo "date.timezone = \"Europe/Berlin\"" >> /usr/local/etc/php/php.ini \
	&& echo "date.default_latitude = 52.5194" >> /usr/local/etc/php/php.ini \
	&& echo "date.default_longitude = 13.4067" >> /usr/local/etc/php/php.ini

#
# ionCube
#

ENV PHP_MAJOR_VERSION 7.0

RUN set -x \
	&& curl -SL "https://downloads.ioncube.com/loader_downloads/ioncube_loaders_lin_x86-64.tar.gz" \
		-o /opt/ioncube_loaders_lin_x86-64.tar.gz \
	&& mkdir -p /opt/ioncube \
	&& tar -xof /opt/ioncube_loaders_lin_x86-64.tar.gz -C /opt/ioncube --strip-components=1 \
	&& rm /opt/ioncube_loaders_lin_x86-64.tar.gz* \
	&& echo "zend_extension =/opt/ioncube/ioncube_loader_lin_$PHP_MAJOR_VERSION.so" >> /usr/local/etc/php/php.ini

#
# Work directory
#

ENV FMPN_WORKDIR /var/fm-productnode

WORKDIR ${FMPN_WORKDIR}

#
# fm-ProductNode Release 2.2
#

RUN set -x \
	&& curl -SL "https://muehlbauer.ocloud.de/index.php/s/vXgG3ZfxednY9Ff/download" \
		-o ${FMPN_WORKDIR}/fmProductNode.tar.gz \
	&& tar -xof ${FMPN_WORKDIR}/fmProductNode.tar.gz -C ${FMPN_WORKDIR} \
	&& rm ${FMPN_WORKDIR}/fmProductNode.tar.gz

CMD ["/bin/bash", "-c"]
