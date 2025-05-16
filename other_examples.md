1. query: how many fridges are there
   generated sql query:  SELECT COUNT(*) FROM fridge;
   chat's final response: There are 3 fridges.

2. query: How many eggs are in my shopping cart?
   generated sql query:  SELECT amount FROM food WHERE item_name = 'eggs';
   chat's final response:  You have 8 eggs in your shopping cart.
   
3. query: what foods am i running low on?
   generated sql query:   SELECT item_name FROM food WHERE amount <= 2;
   chat's final response:   You are running low on the following foods: milk, cheese, butter, lettuce, orange juice, and ice cream. It's a good idea to restock these items soon!
   
4. query: do i have any shelves that are full in fridge 1?
   generated sql query: SELECT * FROM shelf WHERE fridge_id = 1 AND open_space = false;
   chat's final response: Yes, you have a shelf that is full in fridge 1. Shelf number 5 is occupied with an item named "butter".
   
5. query: where did i put my milk?
   generated sql query:  SELECT fridge_id FROM shelf WHERE item_name = 'milk';
   chat's final response: Your milk is in the fridge with the ID number 1.
   
6. query: are my eggs ok to eat?
   generated sql query:  SELECT exp_date FROM food WHERE item_name = 'eggs';
   chat's final response:  The expiration date for your eggs is May 15, 2025. If today's date is before that, your eggs are still okay to eat. Just make sure to also check if they have been stored properly and show no signs of spoilage.

7. query: i want to make a salad. what ingredients do i have?
   generated sql query:  SELECT item_name FROM shelf WHERE item_name IN ('lettuce', 'tomatoes') AND open_space = true;
   chat's final response:   You have both lettuce and tomatoes available for making a salad.

8.  query: i want to make a rainbow of food for an art project. what do i have? what else should i buy?
   generated sql query:   SELECT item_name FROM food;
   chat's final response:
         Based on the items you currently have, you can create a partial rainbow of food as follows:
         - Red: Tomatoes, Apples
         - Green: Lettuce
         - White/Brown: Eggs, Milk, Yogurt, Cheese, Butter, Chicken
         - Orange: Orange Juice
         
         To complete your rainbow art project, you might want to consider adding foods that are blue, yellow, purple, and perhaps a brighter shade of green. Some suggestions for these colors          include:
         
         - Blue: Blueberries
         - Yellow: Bananas, Lemons, or Corn
         - Purple: Grapes, Eggplant
         - Bright Green: Lime, Kiwi
         
         This will give you a full array of colors for your rainbow.

   
