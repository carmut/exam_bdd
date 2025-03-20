-- question 1
SELECT * FROM dishes WHERE price < 20;

-- question 2 
SELECT * FROM dishes 
JOIN chefs ON chefs.id = dishes.chef_id
JOIN restaurants ON restaurants.id = chefs.restaurant_id
WHERE restaurants.cuisine_type IN('française', 'italienne');

-- question 3
SELECT ingredients.name FROM ingredients
JOIN dishes ON dishes.id = ingredients.dish_id
WHERE dishes.name = 'Bœuf Bourguignon';

-- question 4
SELECT chefs.name, restaurants.name FROM chefs
JOIN restaurants ON restaurants.id = chefs.restaurant_id;

-- question 5
SELECT chefs.name, dishes.name FROM chefs
JOIN dishes ON dishes.chef_id = chefs.id;

-- question 6
SELECT chefs.name, COUNT(dishes.chef_id) FROM chefs
JOIN dishes ON dishes.chef_id = chefs.id
GROUP BY dishes.chef_id
HAVING COUNT(dishes.chef_id) >= 2;

-- question 7
SELECT COUNT(chefs.id) FROM chefs
JOIN dishes ON dishes.chef_id = chefs.id
GROUP BY dishes.chef_id
HAVING COUNT(dishes.chef_id) = 1;

-- question 8
SELECT restaurants.cuisine_type, COUNT(restaurants.cuisine_type) FROM dishes
JOIN chefs ON chefs.id = dishes.chef_id
JOIN restaurants ON restaurants.id = chefs.restaurant_id
GROUP BY restaurants.cuisine_type;

-- question 9
SELECT restaurants.cuisine_type, COUNT(restaurants.cuisine_type), AVG(dishes.price) FROM dishes
JOIN chefs ON chefs.id = dishes.chef_id
JOIN restaurants ON restaurants.id = chefs.restaurant_id
GROUP BY restaurants.cuisine_type;

-- question 10
SELECT chefs.name, AVG(dishes.price) FROM dishes
JOIN chefs ON chefs.id = dishes.chef_id
JOIN restaurants ON restaurants.id = chefs.restaurant_id
GROUP BY chefs.name
HAVING COUNT(chefs.name) >= 2;