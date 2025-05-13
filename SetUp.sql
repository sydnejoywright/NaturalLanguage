-- Insert into fridge (omit id, it will auto-increment)
INSERT INTO fridge (available_space) VALUES
('l'),
('m'),
('h');

-- Insert into shelf (omit shelf_number, it will auto-increment)
INSERT INTO shelf (item_name, item_id, fridge_id, open_space) VALUES
('eggs', 100, 1, true),
('milk', 101, 1, true),
('yogurt', 102, 1, true),
('cheese', 103, 1, true),
('butter', 104, 1, false),
('lettuce', 105, 2, true),
('tomatoes', 106, 2, true),
('chicken', 107, 2, false),
('orange juice', 108, 3, true),
('apples', 109, 3, true),
('ice cream', 110, 3, false);

-- Insert into food (omit food_id, it will auto-increment)
INSERT INTO food (item_name, exp_date, purchase_date, amount) VALUES
(100, 'eggs', '2025-05-15', '2025-05-01', 8),
(101, 'milk', '2025-05-14', '2025-05-02', 1),
(102, 'yogurt', '2025-05-18', '2025-05-05', 6),
(103, 'cheese', '2025-06-01', '2025-05-01', 2),
(104, 'butter', '2025-06-15', '2025-05-03', 1),
(105, 'lettuce', '2025-05-12', '2025-05-10', 1),
(106, 'tomatoes', '2025-05-14', '2025-05-09', 5),
(107, 'chicken', '2025-05-13', '2025-05-07', 3),
(108, 'orange juice', '2025-06-10', '2025-05-04', 2),
(109, 'apples', '2025-05-20', '2025-05-08', 6),
(110, 'ice cream', '2025-12-31', '2025-05-01', 1);


