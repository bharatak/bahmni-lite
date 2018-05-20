#!/bin/sh

if [ -f /etc/bahmni-installer/bahmni.conf ]; then
. /etc/bahmni-installer/bahmni.conf
fi

link_dirs(){
    rm -rf /home/$OPENMRS_SERVER_USER/.OpenMRS/modules
    ln -s $MODULE_REPO /home/$OPENMRS_SERVER_USER/.OpenMRS/modules
    chown -R bahmni:bahmni /opt/openmrs/modules
}

create_configuration_dirs(){
    ln -s /opt/openmrs/bahmnicore.properties /home/$OPENMRS_SERVER_USER/.OpenMRS/bahmnicore.properties
    mkdir -p $PATIENT_IMAGES_DIR
    mkdir -p $DOCUMENT_IMAGES_DIR
    mkdir -p $UPLOADED_FILES_DIR
    mkdir -p $UPLOADED_RESULTS_DIR

    cp -f /opt/openmrs/etc/blank-user.png $PATIENT_IMAGES_DIR/blank-user.png

    chown -R bahmni:bahmni /opt/openmrs
    chown -R bahmni:bahmni $UPLOADS_DIR
    chmod 755 $UPLOADS_DIR;
    chmod -R 755 $PATIENT_IMAGES_DIR
    chmod -R 755 $DOCUMENT_IMAGES_DIR
    chmod -R 755 $UPLOADED_FILES_DIR
    chmod -R 755 $UPLOADED_RESULTS_DIR
    mkdir /bahmni-code
}

setup_tomcat_temp_dir(){
    mkdir -p $TOMCAT_TEMP_DIRECTORY
    chown -R bahmni:bahmni $TOMCAT_TEMP_DIRECTORY
}

#create bahmni user and group if doesn't exist
USERID=bahmni
GROUPID=bahmni
/bin/id -g $GROUPID 2>/dev/null
[ $? -eq 1 ]
addgroup -g 1000 bahmni

/bin/id $USERID 2>/dev/null
[ $? -eq 1 ]
adduser -D -u 1000 bahmni -G bahmni bahmni

mkdir -p /bahmni_temp/logs
chown -R bahmni:bahmni /bahmni_temp
chmod -R 766 /bahmni_temp

mkdir -p /opt/openmrs/run

#create links
ln -s /opt/openmrs/etc /etc/openmrs
ln -s /opt/openmrs/bin/openmrs /etc/init.d/openmrs
ln -s /opt/openmrs/run /var/run/openmrs
ln -s /opt/openmrs/openmrs /var/run/openmrs/openmrs
ln -s /opt/openmrs/log /var/log/openmrs

mkdir -p /opt/openmrs/openmrs && cd /opt/openmrs/openmrs && unzip ../openmrs.war
rm -f /opt/openmrs/openmrs.war

#copy configs
mkdir -p /opt/openmrs/openmrs/WEB-INF/classes/ && cp /opt/openmrs/etc/log4j.xml /opt/openmrs/openmrs/WEB-INF/classes/
cp -f /opt/openmrs/etc/web.xml /opt/openmrs/openmrs/WEB-INF/

# permissions
chown -R bahmni:bahmni /opt/openmrs
chown -R bahmni:bahmni /var/log/openmrs
chown -R bahmni:bahmni /var/run/openmrs
chown -R bahmni:bahmni /etc/init.d/openmrs
chown -R bahmni:bahmni /etc/openmrs
chmod -R 777 /opt/openmrs/run

. /etc/openmrs/openmrs.conf
. /etc/openmrs/bahmni-emr.conf

link_dirs
create_configuration_dirs
setup_tomcat_temp_dir