-- Question 1: Transform ProductDetail into 1NF
-- Create a new normalized table
CREATE TABLE ProductDetail_1NF (
    OrderID INT,
    CustomerName VARCHAR(255),
    Product VARCHAR(255),
    PRIMARY KEY (OrderID, Product)
);

-- Insert data into the new table
INSERT INTO ProductDetail_1NF (OrderID, CustomerName, Product) VALUES (101, 'John Doe', 'Laptop');
INSERT INTO ProductDetail_1NF (OrderID, CustomerName, Product) VALUES (101, 'John Doe', 'Mouse');
INSERT INTO ProductDetail_1NF (OrderID, CustomerName, Product) VALUES (102, 'Jane Smith', 'Tablet');
INSERT INTO ProductDetail_1NF (OrderID, CustomerName, Product) VALUES (102, 'Jane Smith', 'Keyboard');
INSERT INTO ProductDetail_1NF (OrderID, CustomerName, Product) VALUES (102, 'Jane Smith', 'Mouse');
INSERT INTO ProductDetail_1NF (OrderID, CustomerName, Product) VALUES (103, 'Emily Clark', 'Phone');

-- Question 2: Transform OrderDetails into 2NF
-- Create a new Customers table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerName VARCHAR(255) UNIQUE
);

-- Insert unique customer names
INSERT INTO Customers (CustomerName) VALUES ('John Doe');
INSERT INTO Customers (CustomerName) VALUES ('Jane Smith');
INSERT INTO Customers (CustomerName) VALUES ('Emily Clark');

-- Create a new Orders table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Insert order details
INSERT INTO Orders (OrderID, CustomerID) VALUES (101, 1);
INSERT INTO Orders (OrderID, CustomerID) VALUES (102, 2);
INSERT INTO Orders (OrderID, CustomerID) VALUES (103, 3);

-- Create a new OrderProducts table to store product details
CREATE TABLE OrderProducts (
    OrderID INT,
    Product VARCHAR(255),
    Quantity INT,
    PRIMARY KEY (OrderID, Product),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Insert product details
INSERT INTO OrderProducts (OrderID, Product, Quantity) VALUES (101, 'Laptop', 2);
INSERT INTO OrderProducts (OrderID, Product, Quantity) VALUES (101, 'Mouse', 1);
INSERT INTO OrderProducts (OrderID, Product, Quantity) VALUES (102, 'Tablet', 3);
INSERT INTO OrderProducts (OrderID, Product, Quantity) VALUES (102, 'Keyboard', 1);
INSERT INTO OrderProducts (OrderID, Product, Quantity) VALUES (102, 'Mouse', 2);
INSERT INTO OrderProducts (OrderID, Product, Quantity) VALUES (103, 'Phone', 1);
