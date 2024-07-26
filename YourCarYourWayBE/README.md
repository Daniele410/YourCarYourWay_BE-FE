Welcome to the `YourCarYourWayBE` repository! This repository contains a proof-of-concept (POC) for a Java Spring application demonstrating WebSocket functionality for real-time communication.

## Overview

`YourCarYourWayBE` is a backend service developed with Java Spring that showcases WebSocket integration for real-time updates and interactions. This POC serves as a foundational example to help you understand and implement WebSocket in a Spring Boot application.

## Features

- **WebSocket Support**: Demonstrates real-time communication using WebSocket.
- **Java Spring Boot**: Utilizes the Spring Boot framework for easy setup and development.
- **Basic WebSocket Endpoints**: Includes example WebSocket endpoints for real-time interaction.

## Prerequisites

To run this project, you will need:

- [Java 17](https://www.oracle.com/java/technologies/javase-jdk17-downloads.html) or higher
- [Maven](https://maven.apache.org/) for building the project

## Installation

To set up and run the project locally, follow these steps:

1. **Clone the Repository**

   ```bash
   git clone https://github.com/Daniele410/YourCarYourWayBE.git

2. **Build the Project**

   Navigate to the project directory and run the following command to build the project:

   ```bash
   mvn clean install

3. **Run the Application**

   After building the project, you can run it using:

   ```bash
   mvn spring-boot:run

## Testing the WebSocket

To test the WebSocket functionality, you can use tools like [WebSocket King](https://websocketking.com) or any WebSocket client of your choice. Follow these steps:

1. Open your WebSocket client.
2. Connect to `ws://localhost:3000/chat/{roomId}`. Replace `{roomId}` with any string to represent the room ID.
3. Send a JSON message in the format `{"message": "Hello, World!", "user": "username"}`.
4. You should receive the message back if everything is set up correctly.

## Development Notes

- The application uses Spring Boot `3.3.1` and Java `17` for development.
- WebSocket messages are handled in the `WebSocketController` under the `/chat/{roomId}` mapping.

## Troubleshooting

If you encounter any issues while running the application:
- Ensure Maven is correctly installed and configured.
- Check that Java 17 or higher is installed.
- Review application logs for any error messages.

## Acknowledgments

This project was built as a learning tool to understand WebSocket integration with Spring Boot. Special thanks to the Spring Boot team for their comprehensive documentation.

## Contact

For any queries or further assistance, please open an issue in this repository.