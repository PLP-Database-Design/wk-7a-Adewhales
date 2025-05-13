-- Question 1 Question 1 Achieving 1NF (First Normal Form)
-- Given the following table ProductDetail:
-- OrderID	   CustomerName	     Products
-- 101	        Olufemi Daniel	 Laptop, Mouse
-- 102	        Janet Hassan	 Tablet, Keyboard, Mouse
-- 103	        Emily Babatunde	 Phone
    
-- Write an SQL query to transform this table into 1NF, ensuring that each row represents a single product for an order

-- Answer

-- Create a new table with a proper structure
CREATE TABLE ProductDetail_1NF (
    OrderID INT,
    CustomerName VARCHAR(100),
    Product VARCHAR(50)
);

-- Insert data in 1NF format (each product gets its own row)
INSERT INTO ProductDetail_1NF (OrderID, CustomerName, Product)
VALUES 
    (101, 'Olufemi Daniel', 'Laptop'),
    (101, 'Olufemi Daniel', 'Mouse'),
    (102, 'Janet Hassan', 'Tablet'),
    (102, 'Jante Hassan', 'Keyboard'),
    (102, 'Janet Hassan', 'Mouse'),
    (103, 'Emily Babatunde', 'Phone');


-- Question 2 Achieving 2NF (Second Normal Form)
-- Given the following table OrderDetails, which is already in 1NF but still contains partial dependencies:

-- OrderID	CustomerName	Product	Quantity
-- 101	    Olufemi Daniel	    Laptop	  2
-- 101	    Olufemi Daniel	    Mouse	  1
-- 102	    Janet Hassan	    Tablet	  3
-- 102	    Janet Hassan	    Keyboard  1
-- 102	    Janet Hassan	    Mouse	  2
-- 103	    Emily Babatunde	    Phone	  1

-- Write an SQL query to transform this table into 2NF by removing partial dependencies. Ensure that each non-key column fully depends on the entire primary key.
-- Create the Orders table to store customer details separately

-- Answer

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

-- Populate the Orders table with distinct OrderIDs and CustomerNames
INSERT INTO Orders (OrderID, CustomerName)
VALUES 
    (101, 'Olufemi Daniel'),
    (102, 'Janet Hassan'),
    (103, 'Emily Babatunde');

-- Create the OrderDetails_2NF table to eliminate partial dependency
CREATE TABLE OrderDetails_2NF (
    OrderID INT,
    Product VARCHAR(50),
    Quantity INT,
    PRIMARY KEY (OrderID, Product),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)  -- Establish relational integrity
);

-- Insert transformed data into OrderDetails_2NF
INSERT INTO OrderDetails_2NF (OrderID, Product, Quantity)
VALUES 
    (101, 'Laptop', 2),
    (101, 'Mouse', 1),
    (102, 'Tablet', 3),
    (102, 'Keyboard', 1),
    (102, 'Mouse', 2),
    (103, 'Phone', 1);

-- Retrieve structured data
SELECT * FROM OrderDetails_2NF;

