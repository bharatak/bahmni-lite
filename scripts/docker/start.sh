#!/bin/sh
echo "In start.sh $SERVER_OPTS"
java -jar $SERVER_OPTS $DEBUG_OPTS /opt/openmrs/lib/openmrs.jar
