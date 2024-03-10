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
