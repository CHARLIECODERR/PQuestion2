FROM openjdk:17

# Set the working directory
WORKDIR /app

# Copy the Java file into the container
COPY HelloWorld.java .

# Compile the Java program
RUN javac HelloWorld.java

# Command to run the Java program
CMD ["java", "HelloWorld"]
