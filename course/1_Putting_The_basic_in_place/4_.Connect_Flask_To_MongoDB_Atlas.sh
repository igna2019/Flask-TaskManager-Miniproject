Connect Flask To MongoDB Atlas


At this point, we have our basic Flask application in place.
We've also created a corresponding application in Heroku and connected to it.
We've created a Git repository that pushes to Heroku.
So now we're ready to wire up our database to our Flask application.
To get Flask talking to Mongo, we're going to install a third party library called flask-pymongo.
This is just slightly different from the pymongo that you would have used in our earlier lessons in the sense that it's optimized to work with Flask.

> pip3 install flask-pymongo

So we've installed that.
We also need to install a package called dnsython to use the new style connection string for MongoDB Atlas.

> pip3 install dnspython

Now that both of those are installed, we can go back to our app.py and add some additional imports to reflect our new installation.
So we're going to access our library here from flask_pymongo.
Import PyMongo.
We also said that MongoDB stores its data in a JSON like format called BSON.
So we want to import something from the BSON library as well, which we'll use later on in the project.
Now those import are done, we want to add some configuration to our Flask application.
So we're going to add the Mongo database name and the URL linking to that database.
So let's do that now.
We do app.config["MONGO_DBNAME"] = 'task_manager'
This is optional for the version of PyMongo that we're using, but we'll include it anyway.
We'll then do app.config again.
This time, provide MONGO_URI.
We'll leave our quotes empty for now because we're going to go back to our MongoDB Atlas page and grab our connection string.
So we'll click on overview and connect.
Click on connect your application.
Once again, we're going to get our Short SRV connection string.
We'll copy that to the clipboard.
mongodb+srv://root:<password>@cluster0.pbgap.mongodb.net/<dbname>?retryWrites=true&w=majority
Go back to our application and paste it in between the quotes.
As before, we need to change our database name here to the one that we're going to use, which will be task_manager.
We're going to put in our root password, which is .....
add on home/gitpod

vi .bashrc 

export  MONGO_URI="mongodb+srv://root:<password>@cluster0.pbgap.mongodb.net/task_manager?retryWrites=true&w=majority"


to test, open a new terminal and type:

> echo $MONGO_URI

the outcome should be:

gitpod /workspace/Flask-TaskManager-Miniproject $ echo $MONGO_URI
mongodb+srv://root:<password>@cluster0.pbgap.mongodb.net/task_manager?retryWrites=true&w=majority
gitpod /workspace/Flask-TaskManager-Miniproject $ 

It's worth mentioning that this is not good practice to have our username and our password in our application like this.
When we push it up to GitHub, it's going to be visible to the whole world.
It's far better to use an environment variable, which is what I suggest you do in production.
Now that that's done, let's create an instance of PyMongo.
We'll add the app into that with what's called a constructor method.
So mongo = PyMongo(app)
Our app object is going to be pushed in between the brackets there as an argument.
So now we're set up to make our connection to the database.
In order to do that, we're going to create a function with a decorator that includes a route to that function.
Remember the routing is a string that, when we attach it to a URL, will redirect to a particular function in our Flask application.
You'll see something similar in the Django applications you'll work with later.
In our case, we're going to use a string called get_tasks.
We're going to create a function with that decorator using app.root.
I'm going to add it on beneath the default root here.
I'm also going to change the name of the function to get_tasks.
We'll need to use some additional functionality from Flask as well.
So we're going to also import the render_template, redirect, requests, and url_for functions.
You'll see those used throughout the rest of the project.
Notice now we have two decorators.
We have the / and a string with get_tasks.
So when the application is run, then the default function that will be called will be get_ tasks because of that single / decorator that's in place.
What we want to do is render a template.
So it's going to redirect to an existing template, which will be called tasks.hmtl.
We're also going to supply a tasks collection, which will be returned from making a call directly to Mongo.
So we'll use tasks=mongo.db.tasks, which is our collection.
Then we're going to use the find() method, which will return everything in our tasks collection.

import os
from flask import Flask, render_template, redirect, request, url_for
from flask_pymongo import PyMongo
from bson.objectid import ObjectId 

app = Flask(__name__)
app.config["MONGO_DBNAME"] = 'task_manager'
app.config["MONGO_URI"] = os.getenv('MONGO_URI', 'mongodb://localhost')

mongo = PyMongo(app)


@app.route('/')
@app.route('/get_tasks')
def get_tasks():
    return render_template("tasks.html", tasks=mongo.db.tasks.find())



So the next thing that we need to do now that that's in place is to create our template.
You'll remember that the templates in a Flask application are placed inside a templates directory.
This spelling is important because Flask looks for a directory with that name for our HTML files.
So we'll create our templates directory, and, as named in our render_template function, a file called tasks.html.
For the moment, we'll create a full HTML document in this file.
Later, we'll refactor it so that it inherits from a parent template.
So I'm just going to create a HTML document.
We'll leave the head empty for now.
Create the body.
Now we're going to use our templating language to loop through the tasks in our collection.
So we'll use our {% for task in tasks $}.
I'd like to create my {% end for %} as well before adding any content between our for and end for.



<html>
<head>
</head>

<body>
    {% for task in tasks %}
        {{task.task_name}}
        {{task.category_name}}
        {{task.category_description}}
        {{task.is_urgent}}
        {{task.due_date}}

    {% endfor %}
</body>
</html>



What we're just going to do here is display the contents of each field name that's in our database in our tasks collection.
You'll remember when we created it that it's tasks_name, category_name, tasks_description, is_urgent, and due_date.
Now that all of that's in place, we can save our file, go back to our app.py, and run it.
Now it's worth mentioning at this point that the runner that mine is using, you can see here, is Python3.
If yours says Python2, then this is not going to work.
So if it does for any reason, click on the gear icon up in the top right corner of the screen.
Go to Python support and make sure that Python Version is set to Python3.
You might have to stop and restart any running applications for this to take effect.
Now that that's done, let's go to our preview, refresh it, and you can see that we have buy detergent, our category is home, we have our description, our is urgent flag, and our due date.
So it's working.
We've successfully connected to our MongoDB database.
We brought the data back into our Flask application and displayed it in a template.
So we're good to go and build the rest of our application.
