 Submit Add Task Form Data

 1-What is it?

A submit button

2- What does it do?

It will allow the user to submit the form (and save the new task to the database)

3-How do you use it?

You create a JavaScript event that will run the insert_task() function when the user clicks the submit button


Description



We're nearly at the point where we can submit a new task.
By the way, once we do this we can reuse this approach as a template for editing tasks and also adding and editing categories later.
The last thing we need is a button.
So we go back to Materialize, and we grab some button markup.
You can see here, the button has an associated icon, as well.
Convention has it that the button goes in at the end of the form because you fill in your form elements, you scan them, you view them, and, once you're happy, you submit.
Let's put our button inside here.

<div class="row">
      <button class="btn waves-effect waves-light" type="submit" name="action">
        Submit
        <i class="material-icons right">send</i>
      </button>
</div>


Now, the form is clever enough to recognize when the submit button is being clicked.
And its response to that button being clicked is to submit to a location.
In our case, we will specify the name of a function.
Let's just check it here. We can see add task.

<div class="row">
      <button class="btn waves-effect waves-light" type="submit" name="action">Add Task
        
        <i class="material-icons right">playlist_add</i>
      </button>
    </div>

We get method not allowed because we haven't specified the function, or the method, that we will use to respond to that form being submitted.
So let's go back to our app.py, and let's create a new function.
This function will be called insert_task.
Now, because we're submitting a form, and we're submitting using POST, we must refer to the HTTP method that will be used to deliver the form data.
In our case, it's POST, so we specify POST here.
The default is GET.
It's only when you use POST as the submission format on your form that you must specify the method as POST in your function.
We go back to Mongo, we get the tasks collection, and then we do a task_insert.
We do insert_one.
What we insert is the request.
Remember, whenever you submit information to a URI or to some web location, it is submitted in the form of a request object.
We grab that request object.
And inside that, we say show me the form.
And we're converting that form, in our case, to a dictionary, so it can easily be understood by Mongo.
Any of the form fields that have data inside them, or are active, will be submitted as part of the form submission, and ultimately, we'll go on to create a new document in our tasks collection.
In reality, you'll probably want to do some validation, both on the HTML side and inside here for required fields.
But for our purposes now, for simplicity, we will just send the entire form.
Once that's done, we redirect to get_tasks, so we can view that new task in our collection.
It's just good practice.

@app.route('/insert_task' , methods=['POST'])
def insert_task():
    tasks = mongo.db.tasks
    tasks.insert_one(request.form.to_dict())
    return redirect(url_for('get_tasks'))

Let's go back over to form and specify our insert_tasks function inside our action attribute as the value for that action attribute.
So url_for.
Remember, that is saying find the URL, or use the URL, for a function called insert_task.
Our insert_task is singular because you want to insert one at a time.
There's our method. It's POST.
That's why we used the POST configuration.


<form action="{{ url_for('insert_task')}}" method="POST" class="col s12">


Let's test.
I've got our category, our task name, our description.
Let's choose a due date and specify that this task is urgent.
Click on add task, and this updates the database.
We return to get tasks, and we can see the new task.
So it looks good.
Let's just verify.
We can see that the new task should be there, and there it is.
So we have our core functionality in place, and we will reuse this.