CREATE TABLE fridge(
    id INT PRIMARY KEY,
    available_space CHAR(1),
    CHECK (available_space IN ('l', 'm', 'h'))
);

CREATE TABLE shelf(
    shelf_number INT PRIMARY KEY,
    CHECK (shelf_number <= 10),
    item_name VARCHAR(30),
    item_id INT,
    fridge_id INT,
    open_space BOOLEAN
    FOREIGN KEY (fridge_id) REFERENCES fridge(id)
);

CREATE TABLE food(
    food_id INT PRIMARY KEY,
    item_name VARCHAR(30),
    exp_date DATE,
    purchase_date DATE,
    amount INT,
);


