### Setting up Bahmni Developer Machine using Docker
- You can watch this in a youtube video [here](https://youtu.be/yYigHj7SQbM)
- Create a folder called bahmni-code somewhere on your filesystem
- Checkout the following repos to this newly created folder.  You can copy to this folder if you already have it somewhere.
        - [default-config](https://github.com/bahmni/default-config)
        - [openmrs-module-bahmniapps](https://github.com/bahmni/openmrs-module-bahmniapps)
- Build the bahmniapps project using the following [instructions](https://bahmni.atlassian.net/wiki/spaces/BAH/pages/15106096/Working+on+Bahmni+OpenMRS+frontend)
- Run the EMR container by attaching this folder as a volume.  This way, any changes done to the filesystem are reflected inside the docker container.
```sh
docker run --name emr -v path_to_this_folder/bahmni-code:/bahmni-code -p 8050:8050 -p 8000:8000 --network=bahmni-network -d bharatak/bahmni:latest
```
- Once the server is running, validate the changes by modifying some code files.

### Troubleshooting
- If you see that the changes you made to code files are not reflected, it could be a browser cache issue.  Check the option "Disable Cache" (Chrome's Developer Toolbox > Network > Disable cache)