CREATE TABLE dealerships (
    dealership_id INT AUTO_INCREMENT,
    name VARCHAR(50),
    address VARCHAR(50),
    phone VARCHAR(12),
    PRIMARY KEY (dealership_id)
    );
    
    CREATE TABLE vehicles (
    VIN VARCHAR(17) NOT NULL,
    make VARCHAR(20),
    model VARCHAR(20),
    color VARCHAR(10),
    year INT,
    sold BOOLEAN,
    PRIMARY KEY (VIN)
);

CREATE TABLE inventory (
    dealership_id INT,
    VIN VARCHAR(17),
    FOREIGN KEY (dealership_id) REFERENCES dealerships(dealership_id),
    FOREIGN KEY (VIN) REFERENCES vehicles(VIN)
);

CREATE TABLE sales_contracts (
    id INT AUTO_INCREMENT,
    VIN VARCHAR(17),
    sale_date DATE,
    sale_price DECIMAL(10, 2),
    PRIMARY KEY (id),
    FOREIGN KEY (VIN) REFERENCES vehicles(VIN)
);

CREATE TABLE lease_contracts (
    id INT AUTO_INCREMENT,
    VIN VARCHAR(17),
    lease_start_date DATE,
    lease_end_date DATE,
    lease_price DECIMAL(10, 2),
    PRIMARY KEY (id),
    FOREIGN KEY (VIN) REFERENCES vehicles(VIN)
);


INSERT INTO dealerships (name, address, phone)
VALUES
('ABC Motors', '123 Main St', '555-123-4567'),
('XYZ Autos', '456 South St', '555-987-6543');

INSERT INTO vehicles (VIN, make, model, color, year, sold)
VALUES
('1HGCM82633A123456', 'Honda', 'Accord', 'Red', 2023, false),
('1HGCM82633A123457', 'Toyota', 'Camry', 'Blue', 2023, false);

INSERT INTO inventory (dealership_id, VIN)
VALUES
(1, '1HGCM82633A123456'),
(2, '1HGCM82633A123457');

INSERT INTO sales_contracts (VIN, sale_date, sale_price)
VALUES
('1HGCM82633A123456', '2023-06-01', 25000.00);

INSERT INTO lease_contracts (VIN, lease_start_date, lease_end_date, lease_price)
VALUES
('1HGCM82633A123457', '2023-06-01', '2024-06-01', 200.00);
