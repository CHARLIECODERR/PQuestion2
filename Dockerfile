FROM openjdk:17

# Set the working directory inside the container
WORKDIR /app

# Copy the source code into the container
COPY src /app/src

# Set the working directory to the source code directory
WORKDIR /app/src

# Compile the Java program
RUN javac HelloWorld.java

# Command to run the Java program
CMD ["java", "HelloWorld"]
