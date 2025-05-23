CREATE DATABASE IF NOT EXISTS demo;
USE demo;
CREATE TABLE Products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    productCode VARCHAR(50),
    productName VARCHAR(100),
    productPrice DECIMAL(10, 2),
    productAmount INT,
    productDescription TEXT,
    productStatus VARCHAR(20)
);
INSERT INTO Products (productCode, productName, productPrice, productAmount, productDescription, productStatus)
VALUES 
('P001', 'Laptop Dell', 1500.00, 10, 'High-end Dell Laptop', 'Available'),
('P002', 'Laptop HP', 1200.00, 15, 'HP Pavilion series', 'Available'),
('P003', 'Mouse Logitech', 25.50, 100, 'Wireless Mouse', 'Available'),
('P004', 'Keyboard Razer', 80.00, 50, 'Mechanical Keyboard', 'Out of Stock');
CREATE UNIQUE INDEX idx_product_code ON Products(productCode);
CREATE INDEX idx_name_price ON Products(productName, productPrice);
EXPLAIN SELECT * FROM Products WHERE productCode = 'P001';

EXPLAIN SELECT * FROM Products WHERE productName = 'Laptop HP' AND productPrice = 1200.00;

CREATE VIEW v_product_basic AS
SELECT productCode, productName, productPrice, productStatus
FROM Products;
CREATE OR REPLACE VIEW v_product_basic AS
SELECT productCode, productName, productPrice, productStatus, productAmount
FROM Products;
DROP VIEW IF EXISTS v_product_basic;
DELIMITER //

CREATE PROCEDURE getAllProducts()
BEGIN
    SELECT * FROM Products;
END //

DELIMITER ;
DELIMITER //

CREATE PROCEDURE addProduct(
    IN p_code VARCHAR(50),
    IN p_name VARCHAR(100),
    IN p_price DECIMAL(10, 2),
    IN p_amount INT,
    IN p_desc TEXT,
    IN p_status VARCHAR(20)
)
BEGIN
    INSERT INTO Products (productCode, productName, productPrice, productAmount, productDescription, productStatus)
    VALUES (p_code, p_name, p_price, p_amount, p_desc, p_status);
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE updateProductById(
    IN p_id INT,
    IN p_name VARCHAR(100),
    IN p_price DECIMAL(10,2),
    IN p_amount INT,
    IN p_desc TEXT,
    IN p_status VARCHAR(20)
)
BEGIN
    UPDATE Products
    SET 
        productName = p_name,
        productPrice = p_price,
        productAmount = p_amount,
        productDescription = p_desc,
        productStatus = p_status
    WHERE id = p_id;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE deleteProductById(IN p_id INT)
BEGIN
    DELETE FROM Products WHERE id = p_id;
END //

DELIMITER ;

CALL getAllProducts();

CALL addProduct('P005', 'Monitor LG', 300.00, 20, 'Full HD Monitor', 'Available');

CALL updateProductById(1, 'Laptop Dell XPS', 1600.00, 8, 'Updated version', 'Available');

CALL deleteProductById(4);



