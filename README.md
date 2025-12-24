# Docker Simplified for Flutter

#### Discover how Docker can simplify the development and deployment of Flutter web apps.

Docker is a platform that simplifies the process of developing, deploying, and running applications by using containers.
These containers are lightweight, portable, and self-sufficient units that package everything an application needs to
run, including code, libraries, and dependencies.

For mobile developers, Docker provides a consistent and isolated environment for building and testing applications,
ensuring that everyone on the team works with the same setup. This consistency helps reduce compatibility issues and
streamlines the development process. Additionally, Docker allows developers to easily create and share development
environments, speeding up the setup process for new projects. Overall, while mobile developers may not always be
familiar with Docker, understanding its benefits can greatly improve the efficiency and reliability of app development
workflows.

Setting up a Flutter web project with Docker involves several steps. Below is a simplified step-by-step guide to help
you get started:

### Step 1: Install Docker

If you haven't already installed Docker on your system, you'll need to do so. Visit the official Docker
website ([https://www.docker.com/](https://www.docker.com/)) and follow the instructions for your operating system to
download and install Docker Desktop.

### Step 2: Create a Flutter Web Project

Create a new Flutter web project or use an existing one that you want to containerize with Docker. If you need to create
a new project, you can do so using the following command:

```bash
flutter create my_flutter_web_project
```

### Step 3: Create a Dockerfile

Create a file named `Dockerfile` in the root directory of your Flutter web project. This file will contain instructions
for Docker to build your project's container. Here's a basic example of a Dockerfile for a Flutter web project:

```Dockerfile
# Use the official Flutter Docker image
FROM cirrusci/flutter:latest

# Set the working directory inside the container
WORKDIR /app

# Copy the Flutter project files to the container
COPY . .

# Install dependencies
RUN flutter pub get

# Build the Flutter web app
RUN flutter build web

# Expose port 8080
EXPOSE 8080

# Run the Flutter web app when the container starts
CMD ["flutter", "run", "-d", "web-server", "--web-hostname", "0.0.0.0"]
```

### Step 4: Build the Docker Image

Open a terminal or command prompt, navigate to the root directory of your Flutter project containing the Dockerfile, and
run the following command to build the Docker image:

```bash
docker build -t my_flutter_web_app .
```

### Step 5: Run the Docker Container

Once the Docker image is built successfully, you can run a container based on that image. Use the following command to
run the container:

```bash
docker run -it -p 8080:8080 my_flutter_web_app
```

### Step 6: Access Your Flutter Web App

After running the Docker container, your Flutter web app should be accessible through a web browser at
`http://localhost:8080` or `http://<docker-machine-ip>:8080` if you're using Docker Toolbox or a similar tool.

That's it! You've successfully set up your Flutter web project to run with Docker. You can now deploy and share your
Flutter web app as a Docker container.