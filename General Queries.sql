
use foods;
-- Added 4 resturants to the database 
 
SELECT * FROM foods.resturants;
INSERT INTO resturants (address, closing_time, created_at, descreption, opening_time, rest_name, rest_number, updated_at)
VALUES 
('123 Main St', '2023-05-17 22:00:00', '2023-05-17 10:30:00', 'A cozy Italian restaurant', '2023-05-17 18:00:00', 'Pasta Paradise', '555-1234', '2023-05-17 10:30:00'),
('456 Elm St', '2023-05-17 21:30:00', '2023-05-17 11:45:00', 'Serving delicious seafood', '2023-05-17 16:30:00', 'Ocean Delights', '555-5678', '2023-05-17 11:45:00'),
('789 Oak St', '2023-05-17 23:00:00', '2023-05-17 09:15:00', 'Authentic Mexican cuisine', '2023-05-17 17:30:00', 'Taco Fiesta', '555-9012', '2023-05-17 09:15:00'),
('778 Oak St', '2023-05-17 23:00:00', '2023-05-17 09:15:00', 'sara cuisine', '2023-05-17 17:30:00', 'Taco Fiesta', '555-9012', '2023-05-17 09:15:00');

-- added ratings to the resturants 
SELECT * FROM foods.ratings;
INSERT INTO ratings (comments, created_at, stars, updated_at, resturant_id, user_id)
VALUES 
('Great food and excellent service!', '2023-05-17 12:30:00', 5, '2023-05-17 12:30:00', 1, 1),
('The ambiance was lovely, but the food was just okay.', '2023-05-16 18:45:00', 3, '2023-05-16 18:45:00', 2, 1),
('Highly recommend this place! The staff is friendly and the dishes are flavorful.', '2023-05-15 20:15:00', 4, '2023-05-15 20:15:00', 3, 1),
('Lovely place! The staff is friendly and the dishes are flavorful.', '2023-05-15 20:15:00', 4, '2023-05-15 20:15:00', 4, 1);

-- added a menu 
INSERT INTO menu (created_at, updated_at, resturant_id)
VALUES 
('2023-05-17 10:30:00', '2023-05-17 10:30:00', 1),
('2023-05-17 11:45:00', '2023-05-17 11:45:00', 2),
('2023-05-17 09:15:00', '2023-05-17 09:15:00', 3),
('2023-05-17 09:15:00', '2023-05-17 09:15:00', 4);


-- create menu items 
INSERT INTO menu_items (created_at, desreption, food_name, food_price, updated_at, menu_id)
VALUES 
('2023-05-17 10:30:00', 'Deliciously grilled chicken with a side of mashed potatoes', 'Grilled Chicken', 12.99, '2023-05-17 10:30:00', 1),
('2023-05-17 11:45:00', 'Creamy tomato soup served with croutons', 'Tomato Soup', 6.99, '2023-05-17 11:45:00', 1),
('2023-05-17 09:15:00', 'A classic burger with cheese, lettuce, and tomato', 'Cheeseburger', 9.99, '2023-05-17 09:15:00', 2),
('2023-05-17 13:00:00', 'Tender steak cooked to perfection', 'Steak', 19.99, '2023-05-17 13:00:00', 2),
('2023-05-17 14:30:00', 'Refreshing mixed greens with vinaigrette dressing', 'Garden Salad', 8.99, '2023-05-17 14:30:00', 3),
('2023-05-17 15:45:00', 'Mouthwatering chocolate cake with a rich ganache', 'Chocolate Cake', 7.99, '2023-05-17 15:45:00', 4);


-- adding roles 
INSERT INTO user_roles (created_at, role_name, updated_at)
VALUES 
('2023-05-17 10:30:00', 'users', '2023-05-17 10:30:00'),
('2023-05-17 11:45:00', 'restaurant_owners', '2023-05-17 11:45:00');

-- adding users from regestry from, then adding them to the databse 

UPDATE users
SET dob = CASE id
    WHEN 1 THEN '1990-06-15 00:00:00'
    WHEN 2 THEN '1985-12-25 00:00:00'
    WHEN 4 THEN '1995-03-10 00:00:00'
    ELSE dob
    END,
    phone_number = CASE id
    WHEN 1 THEN '555-1234'
    WHEN 2 THEN '555-5678'
    WHEN 3 THEN '555-9012'
    ELSE phone_number
    END,
    role_id = CASE id
    WHEN 1 THEN 1
    WHEN 2 THEN 2
    WHEN 3 THEN 1
    ELSE role_id
    END
WHERE id IN (1, 2, 3);

-- Mock data for the "orders" table
INSERT INTO orders (created_at, order_status, quantity, total, updated_at, resturant_id, user_id)
VALUES 
('2023-05-17 10:30:00', 1, 2, 25.99, '2023-05-17 10:30:00', 1, 1),
('2023-05-17 11:45:00', 1, 1, 12.99, '2023-05-17 11:45:00', 2, 2),
('2023-05-17 09:15:00', 0, 3, 35.99, '2023-05-17 09:15:00', 3, 3);

-- added a relationship between menu items and orders many to many relationship 
Insert into orders_menuitems(order_id , item_id)
values 
(2,9),
(3,5),
(1,5);

-- adding categories 
INSERT INTO categories (cat_name, created_at, updated_at)
VALUES 
('Appetizers', '2023-05-17 10:30:00', '2023-05-17 10:30:00'),
('Main Course', '2023-05-17 11:45:00', '2023-05-17 11:45:00'),
('Desserts', '2023-05-17 09:15:00', '2023-05-17 09:15:00');

-- relating categories with menu items 
Insert into categories_menuitems( item_id ,category_id)
values 
(4,1),
(5,2),
(6,3),
(7,3),
(8,2),
(9,2);

-- finding average for all resturants 
SELECT r.rest_name, AVG(ra.stars) AS average_stars 
                   FROM resturants r
                   JOIN ratings ra ON r.id = ra.resturant_id 
                   GROUP BY r.rest_name;
                   
-- find Menu Items by Menu Id
select mi.id,mi.food_name,mi.desreption,mi.food_price, c.cat_name, c.id from menu_items mi
		join menu m on menu_id = menu.id
		join categories_menuitems cm on item_id=mi.id
		join categories c on category_id = c.id
		where m.id =1;
        
-- find menu by resturant id 
  select menu.id , menu_items.food_name, menu_items.desreption, menu_items.food_price, categories.cat_name, resturants.rest_name from menu
  join resturants on resturant_id = resturants.id
  left join menu_items  on menu.id =menu_items.menu_id
  inner join categories_menuitems on item_id = menu_items.id
  inner join categories on category_id =categories.id
  where resturants.id = 1;
  
  
  -- select a resturant by its name 
SELECT resturants.id FROM resturants WHERE rest_name LIKE '%a%';


-- select the resturants from the categories 
  SELECT DISTINCT r.id, r.rest_name , categories.cat_name from menu
  join resturants r on resturant_id = r.id
  left join menu_items  on menu.id =menu_items.menu_id
  inner join categories_menuitems on item_id = menu_items.id
  inner join categories on category_id =categories.id
  where categories.id in (1,2);
  
  
  -- all resturant count 
  select count(*) as count from resturants;
  
  -- getting the average from the stars for each resturant
  SELECT r.rest_name, r.id, AVG(ra.stars) AS average_stars 
            FROM resturants r
            JOIN ratings ra ON r.id = ra.resturant_id 
            GROUP BY r.rest_name, r.id;









