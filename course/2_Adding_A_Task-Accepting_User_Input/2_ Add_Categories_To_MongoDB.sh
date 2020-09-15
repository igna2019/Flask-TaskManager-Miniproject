Add Categories To MongoDB


1- What is it?

A category is a document that consists of a key : value pair e.g. "category_name" : "work"


2- What does it do?

Categories can be used to group similar or related tasks

3- How do you use it?

By adding a new document to your database for each new category


Description


Now let's go back and create some additional categories.
And you can see there that the category really is made up of a key value pair of category name and whatever key we associate with that.
So go into create document.
Change "category_name" from "Home" to "Work".
And when we save it, we see that MongoDB gives us the auto-generated ID.
Again, you can see this as similar to a primary key in a relational database.
Let's add another category.
This time I'll call it music.
Create task and go back.
And we see a list of our categories.
So now we have multiple categories available to us to play around with over in Flask.
