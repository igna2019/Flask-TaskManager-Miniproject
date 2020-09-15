Update Task In The Database

1-What is it?

Edit task form


2-What does it do?

When a user submits an edit task form, they are sending their updated task data to the database

3-How do you use it?

By sending a HTTP post request (upon submission of the form) to save the updated task data to the database



Description


We now have the view elements in place, our HTML.
We also have our values, which are bound to our form fields and form elements.
When we click submit, we now want to update the database with one or more values that have been edited.
It could be a case that none of them are edited, which would be a bit pointless, but it's possible.
So we create our route.
We specify the HTTP method as POST because it's coming from our form.
And remember, our form has been more or less cut and paste from the add task view.
So that will use a POST method.
Why use POST?
Well, one of the reasons is the POST method hides the values from the URL bar when they're being sent across.
We pass in the task ID because that's our hook into the primary key.
Well, the primary key if it was a relational database.
So what we do is we access the tasks collection.
Then we call the update function.
We specify the ID.
That's our key to uniqueness.
Once that's in place, we'll then specify the form fields, and we'll match those to the keys on the task collection.
Notice also, just as the documents in our collections have a separate set of curly braces for our object and our key value pairs, we do the same when updating in Python.
So we have curly braces that wrap around the ID.
Then we have a set of curly braces that wrap around each key value pair outside the ID.
So the task_name, category_name, task_description.
Use the request object to access the form and its form values, or form components.
You need to put these inside quotations because they are a form of JSON.
And use colons instead of equals or assignment values.
These are the things that can catch you up.
To an extent, they will always catch you at some point.
But as you become more experienced, you'll recognize these bugs more quickly.
So we have the due date.
Also, don't forget to separate each key value pair with a comma.
Those comma delimiters provide the intelligence to these functions to let them know that one key value pair is complete, and the next key value pair is available for processing.
This kind of comma separation and colon separation is common across nearly every programming language.
So once you get a feel for it in one language, you'll recognize it very quickly if you end up using a different programming language.



@app.route('/update_task/<task_id>', methods=["POST"])
def update_task(task_id):
    tasks = mongo.db.tasks
    tasks.update( {'_id': ObjectId(task_id)},
    {
        'task_name':request.form.get('task_name'),
        'category_name':request.form.get('category_name'),
        'task_description': request.form.get('task_description'),
        'due_date': request.form.get('due_date'),
        'is_urgent':request.form.get('is_urgent')
    })
    return redirect(url_for('get_tasks'))



We need to run it.
Let's edit the date.
Change fiendly to friendly.
That's just Calendly reminding me to improve my grammar.
Edit task.
And there we see it.
Buy more detergent by the 22nd of January, 2018.
And our edit is complete.