CREATE TABLE fridge (
    id INT AUTO_INCREMENT PRIMARY KEY,
    available_space CHAR(1),
    CHECK (available_space IN ('l', 'm', 'h'))
);

CREATE TABLE shelf (
    shelf_number SERIAL PRIMARY KEY,
    item_name VARCHAR(30),
    item_id INT UNIQUE,
    fridge_id INT,
    open_space BOOLEAN,
    CHECK (shelf_number <= 10),
    FOREIGN KEY (fridge_id) REFERENCES fridge(id),
    FOREIGN KEY (item_id) REFERENCES food(food_id)
);

CREATE TABLE food (
    food_id INT PRIMARY KEY,
    item_name VARCHAR(30),
    exp_date DATE,
    purchase_date DATE,
    amount INT
);
