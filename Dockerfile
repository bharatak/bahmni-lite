FROM frolvlad/alpine-oraclejdk8:8.161.12-cleaned
maintainer 'bahmni-tw@bahmni.com'
ADD build/libs/bahmni-lite-1.0-SNAPSHOT.jar /opt/openmrs/lib/openmrs.jar

ADD resources/openmrs-runtime-docker.properties /opt/openmrs/etc/openmrs-runtime.properties
ADD resources/openmrs-docker.conf /opt/openmrs/etc/openmrs.conf
#Remove the below 2:
ADD resources/placeholder /opt/openmrs/run/placeholder
ADD resources/placeholder /opt/openmrs/log/placeholder

ADD ["resources/log4j.xml","resources/web.xml","resources/bahmni-emr.conf","resources/run-liquibase.sh","resources/blank-user.png","resources/emr_ssl.conf","/opt/openmrs/etc/"]
ADD ["scripts/docker/postinstall.sh","scripts/docker/openmrs","scripts/docker/start.sh","/opt/openmrs/bin/"]
ADD build/resources/main/openmrs.war /opt/openmrs/openmrs.war
ADD ["build/distro/distro-*-SNAPSHOT/reporting-1.12.0.omod", "build/distro/distro-*-SNAPSHOT/uilibrary-2.0.5.omod", "build/distro/distro-*-SNAPSHOT/emrapi-1.24.0-SNAPSHOT.omod", "build/distro/distro-*-SNAPSHOT/episodes-1.0-SNAPSHOT.omod", "build/distro/distro-*-SNAPSHOT/bedmanagement-5.7.0-SNAPSHOT.omod", "build/distro/distro-*-SNAPSHOT/addresshierarchy-2.9.omod", "build/distro/distro-*-SNAPSHOT/appframework-2.10.0.omod", "build/distro/distro-*-SNAPSHOT/htmlwidgets-1.8.0.omod", "build/distro/distro-*-SNAPSHOT/rulesengine-0.91-SNAPSHOT.omod", "build/distro/distro-*-SNAPSHOT/bahmni.ie.apps-0.91-SNAPSHOT.omod", "build/distro/distro-*-SNAPSHOT/auditlog-1.0-SNAPSHOT.omod", "build/distro/distro-*-SNAPSHOT/owa-1.9.0.omod", "build/distro/distro-*-SNAPSHOT/bacteriology-1.1-SNAPSHOT.omod", "build/distro/distro-*-SNAPSHOT/webservices.rest-2.20.0.omod", "build/distro/distro-*-SNAPSHOT/calculation-1.2.omod", "build/distro/distro-*-SNAPSHOT/appointments-1.0-SNAPSHOT.omod", "build/distro/distro-*-SNAPSHOT/idgen-webservices-1.2-SNAPSHOT.omod", "build/distro/distro-*-SNAPSHOT/event-2.5.omod", "build/distro/distro-*-SNAPSHOT/bahmnicore-0.91-SNAPSHOT.omod", "build/distro/distro-*-SNAPSHOT/reference-data-0.91-SNAPSHOT.omod", "build/distro/distro-*-SNAPSHOT/uicommons-2.0.omod", "build/distro/distro-*-SNAPSHOT/legacyui-1.3.3.omod", "build/distro/distro-*-SNAPSHOT/uiframework-3.8.omod", "build/distro/distro-*-SNAPSHOT/idgen-4.4.1.omod", "build/distro/distro-*-SNAPSHOT/serialization.xstream-0.2.12.omod", "build/distro/distro-*-SNAPSHOT/metadatamapping-1.3.1.omod", "build/distro/distro-*-SNAPSHOT/openmrs-atomfeed-2.5.6.omod", "build/distro/distro-*-SNAPSHOT/metadatasharing-1.2.2.omod", "build/distro/distro-*-SNAPSHOT/providermanagement-2.5.0.omod","/opt/openmrs/modules/"]

ADD resources/bahmnicore.properties /opt/openmrs/bahmnicore.properties
ADD resources/bahmni_config /opt/bahmni-web/etc/bahmni_config
ADD resources/bahmniapps /opt/bahmni-web/etc/bahmniapps

RUN /opt/openmrs/bin/postinstall.sh

ENTRYPOINT ["/opt/openmrs/bin/openmrs","start"]