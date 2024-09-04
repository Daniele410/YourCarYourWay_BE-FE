-- Creating the Users table
CREATE TABLE Users (
    user_id SERIAL PRIMARY KEY,  -- Unique identifier for each user
    username VARCHAR(50) UNIQUE NOT NULL,  -- Username must be unique and not null
    email VARCHAR(100) UNIQUE NOT NULL,  -- Email must be unique and not null
    password_hash VARCHAR(255) NOT NULL,  -- Storing hashed passwords
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP  -- Timestamp when the user was created
);

-- Creating the Vehicles table
CREATE TABLE Vehicles (
    vehicle_id SERIAL PRIMARY KEY,  -- Unique identifier for each vehicle
    make VARCHAR(50) NOT NULL,  -- Manufacturer of the vehicle
    model VARCHAR(50) NOT NULL,  -- Model of the vehicle
    year INT NOT NULL,  -- Year of manufacture
    category VARCHAR(50) NOT NULL  -- Category of the vehicle (e.g., SUV, sedan)
);

-- Creating the Reservations table
CREATE TABLE Reservations (
    reservation_id SERIAL PRIMARY KEY,  -- Unique identifier for each reservation
    user_id INT REFERENCES Users(user_id) ON DELETE CASCADE,  -- Foreign key referencing Users
    vehicle_id INT REFERENCES Vehicles(vehicle_id) ON DELETE CASCADE,  -- Foreign key referencing Vehicles
    reservation_date TIMESTAMP NOT NULL,  -- Date and time when the reservation starts
    return_date TIMESTAMP NOT NULL,  -- Date and time when the vehicle is to be returned
    status VARCHAR(20) NOT NULL,  -- Status of the reservation (e.g., booked, canceled)
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP  -- Timestamp when the reservation was made
);

-- Creating the SupportMessages table for customer support interactions
CREATE TABLE SupportMessages (
    message_id SERIAL PRIMARY KEY,  -- Unique identifier for each message
    user_id INT REFERENCES Users(user_id) ON DELETE CASCADE,  -- Foreign key referencing Users
    message_text TEXT NOT NULL,  -- Content of the message
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP  -- Timestamp when the message was sent
);

-- Creating indexes to improve query performance
CREATE INDEX idx_user_username ON Users(username);  -- Index on username for faster searches
CREATE INDEX idx_reservation_user ON Reservations(user_id);  -- Index on user_id in Reservations for faster lookups
CREATE INDEX idx_reservation_vehicle ON Reservations(vehicle_id);  -- Index on vehicle_id in Reservations
CREATE INDEX idx_support_user ON SupportMessages(user_id);  -- Index on user_id in SupportMessages for faster lookups

-- Inserting test data (optional)
INSERT INTO Users (username, email, password_hash) VALUES 
('john_doe', 'john@example.com', 'hashed_password_123'),
('jane_smith', 'jane@example.com', 'hashed_password_456');

INSERT INTO Vehicles (make, model, year, category) VALUES 
('Toyota', 'Camry', 2020, 'Sedan'),
('Ford', 'Explorer', 2019, 'SUV');

INSERT INTO Reservations (user_id, vehicle_id, reservation_date, return_date, status) VALUES 
(1, 1, '2023-08-01 09:00:00', '2023-08-10 09:00:00', 'Booked'),
(2, 2, '2023-08-05 10:00:00', '2023-08-15 10:00:00', 'Booked');