This database allows the user to find out what is in their fridge. 

![image](https://github.com/user-attachments/assets/1f2f7fe0-5f4b-419a-9d88-ecd58909ea12)

I used Single-domain Few-shot Text-to-SQL strategy for the following examples.

Successful Query

Query: how many fridges are there 
generated sql query: SELECT COUNT(*) FROM fridge; 
chat's final response: There are 3 fridges.

Less Effective Query

Query: How many eggs are in my shopping cart? 
generated sql query: SELECT amount FROM food WHERE item_name = 'eggs'; 
chat's final response: You have 8 eggs in your shopping cart.

What made it less effective:

These examples illustrate both the strengths and areas for improvement in the AI-generated queries and friendly responses.

