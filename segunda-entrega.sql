-- Inserting data into `administrators`
INSERT INTO administrators (first_name, last_name, phone, email) VALUES
('John', 'Doe', '555-0101', 'john.doe@example.com'),
('Jane', 'Smith', '555-0102', 'jane.smith@example.com'),
('Alice', 'Johnson', '555-0103', 'alice.johnson@example.com'),
('Bob', 'Lee', '555-0104', 'bob.lee@example.com'),
('Mike', 'Brown', '555-0105', 'mike.brown@example.com'),
('Charlie', 'Davis', '555-0106', 'charlie.davis@example.com'),
('David', 'Martinez', '555-0107', 'david.martinez@example.com'),
('Sarah', 'Lewis', '555-0108', 'sarah.lewis@example.com'),
('Rachel', 'Walker', '555-0109', 'rachel.walker@example.com'),
('Tom', 'Hall', '555-0110', 'tom.hall@example.com');

-- Inserting data into `condominiums`
INSERT INTO condominiums (condo_name, address, unit_count, creation_date, admin_id, contact_phone, contact_email, reserve_fund, status, last_meeting_date) VALUES
('Condo One', '123 Main St', 20, '2021-01-01', 1, '555-1001', 'contact@condoone.com', 10000, 'Active', '2023-07-01'),
('Condo Two', '234 Elm St', 30, '2021-02-01', 2, '555-1002', 'contact@condotwo.com', 15000, 'Active', '2023-06-01'),
('Condo Three', '345 Oak St', 25, '2021-03-01', 3, '555-1003', 'contact@condothree.com', 12000, 'Active', '2023-05-01'),
('Condo Four', '456 Pine St', 40, '2021-04-01', 4, '555-1004', 'contact@condofour.com', 20000, 'Active', '2023-04-01'),
('Condo Five', '567 Birch St', 35, '2021-05-01', 5, '555-1005', 'contact@condofive.com', 18000, 'Active', '2023-03-01'),
('Condo Six', '678 Cedar St', 15, '2021-06-01', 6, '555-1006', 'contact@condosix.com', 9000, 'Active', '2023-02-01'),
('Condo Seven', '789 Spruce St', 10, '2021-07-01', 7, '555-1007', 'contact@condoseven.com', 5000, 'Active', '2023-01-01'),
('Condo Eight', '890 Willow St', 50, '2021-08-01', 8, '555-1008', 'contact@condoeight.com', 25000, 'Active', '2022-12-01'),
('Condo Nine', '901 Maple St', 45, '2021-09-01', 9, '555-1009', 'contact@condonine.com', 22000, 'Active', '2022-11-01'),
('Condo Ten', '1012 Ash St', 50, '2021-10-01', 10, '555-1010', 'contact@condoten.com', 30000, 'Active', '2022-10-01');

-- Inserting data into `units`
INSERT INTO units (condo_id, number, type, square_meters, owner_id) VALUES
(1, '101', 'Apartment', 75.0, 1),
(1, '102', 'Apartment', 75.0, 2),
(1, '103', 'Apartment', 75.0, 3),
(1, '104', 'Apartment', 75.0, 4),
(1, '105', 'Apartment', 75.0, 5),
(1, '106', 'Apartment', 75.0, 6),
(1, '107', 'Apartment', 75.0, 7),
(1, '108', 'Apartment', 75.0, 8),
(1, '109', 'Apartment', 75.0, 9),
(1, '110', 'Apartment', 75.0, 10);

-- Inserting data into `owners`
INSERT INTO owners (first_name, last_name, phone, email) VALUES
('Liam', 'Wilson', '555-2001', 'liam.wilson@example.com'),
('Emma', 'Moore', '555-2002', 'emma.moore@example.com'),
('Noah', 'Taylor', '555-2003', 'noah.taylor@example.com'),
('Olivia', 'Anderson', '555-2004', 'olivia.anderson@example.com'),
('William', 'Thomas', '555-2005', 'william.thomas@example.com'),
('Sophia', 'Jackson', '555-2006', 'sophia.jackson@example.com'),
('James', 'White', '555-2007', 'james.white@example.com'),
('Isabella', 'Harris', '555-2008', 'isabella.harris@example.com'),
('Lucas', 'Martin', '555-2009', 'lucas.martin@example.com'),
('Mia', 'Thompson', '555-2010', 'mia.thompson@example.com');

-- Inserting data into `expenses`
INSERT INTO expenses (unit_id, month_year, total_amount, payment_status) VALUES
(1, '2023-06-01', 200.00, 'Paid'),
(2, '2023-06-01', 200.00, 'Paid'),
(3, '2023-06-01', 200.00, 'Paid'),
(4, '2023-06-01', 200.00, 'Paid'),
(5, '2023-06-01', 200.00, 'Paid'),
(6, '2023-06-01', 200.00, 'Paid'),
(7, '2023-06-01', 200.00, 'Paid'),
(8, '2023-06-01', 200.00, 'Paid'),
(9, '2023-06-01', 200.00, 'Paid'),
(10, '2023-06-01', 200.00, 'Paid');

-- Inserting data into `payments`
INSERT INTO payments (expense_id, payment_date, amount, payment_method) VALUES
(1, '2023-06-02', 200.00, 'Transfer'),
(2, '2023-06-02', 200.00, 'Transfer'),
(3, '2023-06-02', 200.00, 'Transfer'),
(4, '2023-06-02', 200.00, 'Transfer'),
(5, '2023-06-02', 200.00, 'Transfer'),
(6, '2023-06-02', 200.00, 'Transfer'),
(7, '2023-06-02', 200.00, 'Transfer'),
(8, '2023-06-02', 200.00, 'Transfer'),
(9, '2023-06-02', 200.00, 'Transfer'),
(10, '2023-06-02', 200.00, 'Transfer');


CREATE VIEW unit_details AS
SELECT 
    u.unit_id,
    u.number AS unit_number,
    u.type AS unit_type,
    u.square_meters,
    c.condo_name,
    o.first_name AS owner_first_name,
    o.last_name AS owner_last_name,
    o.phone AS owner_phone,
    o.email AS owner_email
FROM 
    units u
JOIN 
    condominiums c ON u.condo_id = c.condo_id
JOIN 
    owners o ON u.owner_id = o.owner_id;


CREATE VIEW expense_payment_status AS
SELECT 
    e.expense_id,
    u.number AS unit_number,
    c.condo_name,
    e.month_year,
    e.total_amount,
    e.payment_status,
    p.payment_method,
    p.payment_date
FROM 
    expenses e
JOIN 
    payments p ON e.expense_id = p.expense_id
JOIN 
    units u ON e.unit_id = u.unit_id
JOIN 
    condominiums c ON u.condo_id = c.condo_id;


CREATE VIEW upcoming_maintenance AS
SELECT 
    m.maintenance_id,
    c.condo_name,
    m.description AS maintenance_description,
    m.scheduled_date,
    m.provider,
    m.estimated_cost
FROM 
    maintenance m
JOIN 
    condominiums c ON m.condo_id = c.condo_id
WHERE 
    m.scheduled_date >= CURRENT_DATE()
ORDER BY 
    m.scheduled_date;


SELECT * FROM unit_details WHERE unit_number = '101';
SELECT * FROM expense_payment_status WHERE condo_name = 'Condo One';
SELECT * FROM upcoming_maintenance;


DELIMITER //

CREATE FUNCTION total_expenses_paid(unit_id_param INT, year_param YEAR)
RETURNS DECIMAL(10, 2)
BEGIN
    DECLARE total_paid DECIMAL(10, 2);

    SELECT SUM(p.amount) INTO total_paid
    FROM payments p
    JOIN expenses e ON p.expense_id = e.expense_id
    WHERE e.unit_id = unit_id_param AND YEAR(e.month_year) = year_param AND e.payment_status = 'Paid';

    RETURN IFNULL(total_paid, 0);
END //

DELIMITER ;

SELECT total_expenses_paid(1, 2023) AS Total_Paid;

DELIMITER //

CREATE FUNCTION get_admin_contact(condo_id_param INT)
RETURNS VARCHAR(50)
BEGIN
    DECLARE contact_phone VARCHAR(50);

    SELECT a.phone INTO contact_phone
    FROM administrators a
    JOIN condominiums c ON a.admin_id = c.admin_id
    WHERE c.condo_id = condo_id_param;

    RETURN contact_phone;
END //

DELIMITER ;

SELECT get_admin_contact(1) AS Admin_Contact;


DELIMITER //

CREATE PROCEDURE AddCommonExpenseAndUpdateReserve(
    IN condo_id_param INT,
    IN description_param VARCHAR(255),
    IN date_param DATE,
    IN amount_param DECIMAL(10, 2),
    IN category_param VARCHAR(50)
)
BEGIN
    -- Insertar el nuevo gasto común
    INSERT INTO common_expenses (condo_id, description, date, amount, category)
    VALUES (condo_id_param, description_param, date_param, amount_param, category_param);
    
    -- Actualizar el fondo de reserva del consorcio, restando el monto del gasto
    UPDATE condominiums
    SET reserve_fund = reserve_fund - amount_param
    WHERE condo_id = condo_id_param;
    
    -- Verificar que el fondo de reserva no sea negativo y emitir una advertencia si es necesario
    SELECT reserve_fund INTO @new_reserve
    FROM condominiums
    WHERE condo_id = condo_id_param;

    IF @new_reserve < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Advertencia: El fondo de reserva ha quedado en negativo.';
    END IF;

END //

DELIMITER ;
