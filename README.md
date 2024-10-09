# cicd-pythonapp

A simple CI/CD pipeline build.

This excersize was to help understand the basics of docker, and pipelines.

Docker


Docker & CI/CD Summary:
docker build: This command creates a Docker image from a Dockerfile. For example, you used docker build -t my-flask-app . to build your Flask app image.
Tagging: You can tag Docker images to version them, helping differentiate between different builds. Common strategies include using semantic versions (e.g., v1.0.0), commit hashes, or the latest tag.
docker run: After building an image, you can use docker run to start a container. For example, you ran your Flask app with docker run -d -p 5000:5000 my-flask-app.
Managing Dependencies:

Using a requirements.txt file in Python projects allows you to manage dependencies like Flask. The Dockerfile is configured to install these dependencies using pip install -r requirements.txt.
You learned how to fix issues related to incompatible versions of dependencies (e.g., Flask and Werkzeug) by pinning compatible versions in requirements.txt.  Every tool has their own package manager.

When building the docker file
FROM - is the base image.  It has a lightweight linux os and will have an full image of whatever you choose.
WORKDIR - tells docker from this point on work from this directory.  So your copy and run will start from here
COPY - is the command that copys the local files into the WORKDIR directory
RUN -is the command that builds the dependencies before the image is created.  This is language dependent cause flask uses a requirement.txt file, java uses an xml etc etc
EXPOSE - is the command to open the port
CMD - the command to start the container [python, 'main.py']

This is also where i learned if you're using a self hosting vm for the runners.  Your VM needs docker access to be able to build the container.

GitHub Actions for CI/CD:

GitHub Actions is a tool for automating the building, testing, and deployment of code. By defining workflows in a .yml file, you can trigger specific actions when events occur (e.g., pushing to the main branch).
Self-hosted runners: You set up a GitHub Actions runner on your own VM, enabling you to build Docker images directly on that machine.
Automating Builds: You configured your workflow to automatically build a Docker image when changes are pushed to the main branch using:
yaml
Copy code
on:
  push:
    branches:
      - main
Deploying Locally: After building the Docker image, you used the same VM (where the runner is hosted) to deploy the container directly, simplifying the process by not needing to transfer the image elsewhere.
Handling Errors in CI/CD:

You encountered errors (e.g., ModuleNotFoundError for Flask) and resolved them by ensuring dependencies were properly installed via requirements.txt and making sure the Docker image was correctly built.
You fixed version compatibility issues (e.g., with Flask and Werkzeug) by pinning compatible versions in requirements.txt.
Best Practices:

Tagging Docker images is important to avoid overwriting previous builds and to facilitate easy rollbacks in case of issues.
Pinning dependencies: Specifying exact versions of dependencies (like Flask and Werkzeug) in requirements.txt prevents breaking changes from newer versions and ensures a consistent environment across builds.
In Summary:
You learned how to:

Build Docker images for your application using a Dockerfile.
Manage Python dependencies using requirements.txt and fix version conflicts.
Set up GitHub Actions with a self-hosted runner to automate the build and deployment of your Dockerized application.
Trigger automatic builds on code changes and deploy the updated application to your VM.
Troubleshoot issues that arise during the CI/CD process, such as missing dependencies or incompatible versions.
