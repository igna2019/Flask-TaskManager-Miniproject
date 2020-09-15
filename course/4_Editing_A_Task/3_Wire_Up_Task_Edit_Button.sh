Wire Up Task Edit Button


1-What is it?

A button called Edit task and a function called edit_task()

2-What does it do?

When a user clicks the Edit task button, the edit_task() will run. This function will rprovide the user with a form to edit the task


3-How do you use it?

You create your edit_task() function in app.py and wire this up to your Edit task button


Now that we have our done and edit buttons in place, let's wire them up.
We're going to wire up the edit button first.
And we're going to create a corresponding function in our app.py that will react to the edit button being clicked.
When we say that we want to edit a task, what we mean is we want to edit the properties associated with that task.
It might be the task name, we might want to change the due date, a description, it may no longer be urgent, and so on.
So in order to do that, we want to display the task on an editable form.

app.py

@app.route('/edit_task/<task_id>')

In order to do that, we need to retrieve that task from the database.

And a guaranteed way of targeting the task we're looking for is to use its ID, which is similar to its primary key in a relational database.

def edti_task(task_id)

You can see that our edit_task() function receives the task ID as part of its routing parameter.
And in order to work with this parameter and find a match in MongoDB, we must convert that to a BSON data type.

As per usual with Python, there's a library that we can use to import specifically for this purpose.

So we're going to use bson.objectid.

from bson.objectid import objectid
And we'll use that to convert the ID that's been passed across from our template into a readable format that's acceptable by MongoDB.
So let's set up our function.
So what we're doing here is ultimately we're fetching the task that matches this task ID.
And we'll eventually redirect it to an edit task HTML template that I'll put together in a few moments.


So we want to find one particular task from our tasks collection.
And the parameter we'll pass is the ID.
So we're looking for a match for the ID, and you must use "_id" because that's the key in our Mongo document.
And we wrap our task_id that's passed in as a parameter into edit_tasks.
And we wrap that in an object, and we cast that to a format that's acceptable to MongoDB.

@app.route("/edit_task/<task_id>")
def edit_task(task_id):
    the_task = mongo.db.task.find_one({"_id":ObjectId(task_id)})
   

The second thing we need is a list of the collections because we're going to use the task that's returned from MongoDB and all the categories in order to populate a form for editing.


@app.route("/edit_task/<task_id>")
def edit_task(task_id):
    the_task = mongo.db.task.find_one({"_id":ObjectId(task_id)})
    all_categories = mongo.db.categories.find()


And we're going to reuse much of the layout of our add_task form for the editing.
But the difference now is instead of having empty fields such as description task, name, due date, and, for example, is urgent, they'll be pre-populated based on the information returned in the task.

As will the category names be populated based on the collection of categories returned in the all categories cursor.
It has passed the task back and the categories to our edittask.html, which I will create for us in a moment.

@app.route("/edit_task/<task_id>")
def edit_task(task_id):
    the_task = mongo.db.task.find_one({"_id":ObjectId(task_id)})
    all_categories = mongo.db.categories.find()
    return render_template('edittask.html', task=the_task, categories=all_categories)

Now I've just added an edittask.html page, and I've copied and pasted the contents of add_task into this.
First thing I need to do is change our heading from Add Task to Edit Task.
We can see we reuse the extends and so on.
And then we'll add a link that when clicked, will take us to this new edit task page or template.
As per usual, we use the url_for.
And we're going to target our edit_task() function that we created a few moments ago.
So we have the function name, and we also have the ID.
That will be it's unique identifier.
And Flask is clever enough to remember the task ID for that particular task in the accordion list of tasks.
So that can be submitted and sent across as part of the link.
We have an error here.
So edit_task task_id.
There's a comma missing between edit_task and task_id.
Let's check that.
Save it.
Run it again.
Still another bug.
It's an issue with the quotation marks now I think.
I'm leaving these in because this is what happens in reality, and typos are made.
It'll give you an idea of what to expect.
And particularly when working with HTML and scripting languages, it's very easy to make typos, in particular with commas, quotation marks, and so on.
We can see we have our buttons in place but that they're not firing.
That is because I've wired up the done template, rather than the edit.
No, it's more than that.
Edit task.
Let's first fix that.
Let's apply it to edit.
Still failing because there is a typo.
Edit Task is spelled with an uppercase T.
The name of our file is edit task with a lowercase T.

task.html

{% for task in tasks %}
  <li>
    <div class="collapsible-header">
      <div class="col s3">
        <i class="material-icons">expand_more</i>
        <a class="waves-effect waves-light btn btn_small">Done</a>
        <a href="{{url_for('edit_task',task_id=task._id)}}" class="waves-effect waves-light btn btn_small blue">Edit</a>
      </div>

File names are case sensitive, as you can see in Flask.
We have our categories in place, and we have our templates.
The next thing to do is populate those with actual task values.
