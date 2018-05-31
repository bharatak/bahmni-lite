#!/bin/sh

backup_original_dirs(){
    if [ -f "/opt/bahmni-web/etc/bahmniapps-original" ]; then
        rm -rf /opt/bahmni-web/etc/bahmniapps
    else
        mv /opt/bahmni-web/etc/bahmniapps /opt/bahmni-web/etc/bahmniapps-original
    fi
    
    if [ -f "/opt/bahmni-web/etc/bahmni-config-original" ]; then
        rm -rf /opt/bahmni-web/etc/bahmni_config
    else
        mv /opt/bahmni-web/etc/bahmni_config /opt/bahmni-web/etc/bahmni-config-original
    fi

}

link_dirs(){
    ln -s /bahmni-code/openmrs-module-bahmniapps/ui/app /opt/bahmni-web/etc/bahmniapps
    ln -s /bahmni-code/default-config /opt/bahmni-web/etc/bahmni_config
}

change_ownership(){
    chown -h bahmni:bahmni /opt/bahmni-web/etc/bahmniapps
    chown -h bahmni:bahmni /opt/bahmni-web/etc/bahmni_config
}

backup_original_dirs
link_dirs
change_ownership