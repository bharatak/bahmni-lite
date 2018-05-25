FROM alpine:3.4

RUN apk add --update mysql-client && rm -rf /var/cache/apk/*
RUN apk --no-cache add openssl wget

RUN wget -O /tmp/openmrs_backup.sql.gz --no-check-certificate https://raw.githubusercontent.com/Bahmni/emr-functional-tests/master/dbdump/openmrs_backup.sql.gz && gzip -d /tmp/openmrs_backup.sql.gz && rm -f openmrs_backup.sql.gz

ADD restore-db.sh /tmp

VOLUME /app

WORKDIR /app

CMD /tmp/restore-db.sh