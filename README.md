# Bahmni Lite

Bahmni Lite aims to provide a simple and lighter version of Bahmni EMR that is platform independent - works on Ubuntu, CentOS and Windows (using Docker).  
- Provides a simple installation of Bahmni EMR to get up-and-running quickly.  
- Designed for a setting up Bahmni on developer machine.
- Designed for "Mobile Clinics" for data entry process.  
- Designed to use as a "Spoke" machine in [Hub and Spoke](https://trello.com/c/EWdwF3JV/1-bahmni-hub-spoke-model-works-offline) model.  

### New Features!
  - Contains docker image of Bahmni EMR.  (Image Size 502 MB)

### Roadmap
- One click installation
- Support for a DEB and RPM packages
- Create a pipeline in GoCD
- HTTPS support in Tomcat
- Merge it to Bahmni organization
- Do more testing and fix installation specific issues

### Known issues
 - The implementer-interface app is not working
 - An error message on the Bahmni's login page.  This is due to missing cgi-bin folder available in apache missing. 

### Installation
- Install Docker using the instructions [here](https://docs.docker.com/install/)
- Run the following commands
```sh
docker network create bahmni-network
docker run --name=mysql --network=bahmni-network -e MYSQL_ROOT_PASSWORD=password -e MYSQL_ROOT_HOST=% -d mysql/mysql-server:5.6
docker run --name helper --rm --network=bahmni-network -e MYSQL_HOST=mysql -e MYSQL_ROOT_PASSWORD=password -it bharatak/bahmni-mysql-starter:latest
docker run --name emr -p 8050:8050 -p 8000:8000 --network=bahmni-network -d bharatak/bahmni:latest
```
- Access the application using the [url](http://localhost:8050/bahmni/home/index.html)
- Video of Bahmni Lite installation is available [here](https://youtu.be/r9mRWSkqOgY)
- Starting, Stopping and Restarting
```sh
docker start emr
docker stop emr
```

### Setting up developer machine
- Follow the installation section and install bahmni-lite on your machine
- Create a folder called bahmni-code and attach it as a volume (TODO: provide more details)

### Installation Video
- Follow this video for easy installation (TODO: come up with a video)
