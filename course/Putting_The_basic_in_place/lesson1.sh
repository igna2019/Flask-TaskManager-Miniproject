

Database Creation With MongoDB Atlas

Walkthrough

When working with data-driven applications, it's always a good idea to start with the data.
Get your data in place first and then build your application around it.
So with that in mind, we can head back to Atlas.
We're going to create a new database.
We do this by clicking on the collections tab and then clicking on the create database button.
Our database is going to be called task_manager.
We're going to create an initial collection called categories.
So we'll type in that and then click on the green create button.
We can see there that our new task manager database has been added along with the categories collection.
We want to add one more collection as well, so we'll click on the green button.
We're going to call this tasks.
These are the two collections that will form the basis of our task manager application.
Now that that's done, we can add our first document.
Now, Mongo, as we've said before, is a document based database as opposed to a table based database like SQL.
But there are similarities. You will recognize some patterns.
So let's click on our categories collection and create an entry.
As before, these contain key value pairs.
Our key is going to be called category_name.
The value will be called home.
We can click on insert.
Notice that MongoDB also provides an ID, which is similar to a primary key in a relational database like SQL.
So that's a valid document that we have there.
So let's click on our tasks collection and create a sample task.
Again, the green insert document button.
We're going to provide category_name once again, and that's going to be set to the category of home.
We're going to provide a few other attributes as well.
Notice that we're creating the documents directly in the editor, rather than using the command line or terminal commands.
This is just to get us up and running.
Our task name in this case is to buy detergent.
Our task description is going to be to get the good eco-friendly one.
We're also going to add an is urgent flag.
This will be a boolean value, so it can be set to true or false.
We're going to set it to false to begin with because buying detergent is not the most important thing in the world.
We're also going to set a due date: 12 January, 2018.
In our tasks summary in the app, only the task name, description, and the due date will appear.
But we're adding additional properties here that we're going to use in the background.
If you want, you can use these and display them as a challenge.
When you finish this project, you might want to do some sorting, for example.
So you can explore MongoDB and do some sorting, maybe based on a category, or whether they're urgent or not.
So there we go.
We've created our first sample task document.
The ID is added.
We're ready to go.
We can now build our flask project upon this data.
