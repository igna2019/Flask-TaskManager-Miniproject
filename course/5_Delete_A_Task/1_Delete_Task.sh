Delete Task

1-What is it?

Delete task button


2-What does it do?

It allows a user to delete a task from the database


3-How do you use it?

By sending a HTTP post request to the database to delete the specified task


Description

We now have the ability to edit a task.
So we can create a task, and now we can edit a task.
The next thing we want to do is to be able to mark a task as complete.
Now, we're taking a quite simplistic approach to it in that by marking a task as done, we're just simply deleting it from the database.

task.html

<div class="col s3">
        <i class="material-icons">expand_more</i>
        <a href="{{url_for('delete_task',task_id=task._id)}}" class="waves-effect waves-light btn btn_small">Done</a>
        <a href="{{url_for('edit_task',task_id=task._id)}}" class="waves-effect waves-light btn btn_small blue">Edit</a>
</div>

As a challenge, you could add a new key value property inside the tasks that maybe marks a task as being complete.
Then when you display tasks, you'll only display tasks where complete is equal to false.
But for now, we'll just delete a task once we're finished with it.
So to do that, we will create a new function called delete_task().
We need to know exactly which task we want to delete.
So the pattern is familiar.
We use task_id.
And we'll pass that in as a parameter into our function that just happens to have the same name, delete_task.
If you do accept the challenge and go on to mark a task as complete, then change the name of the function from delete_task to mark as complete.
So we access the tasks collection, and we call remove.
And we pass in the task_id as the parameter, so it's a very simple function.
Again, we use the syntax as we have been using up until now.
Key value pair inside the curly braces.
We use the object ID to format or parse the task ID in a way that's acceptable to Mongo.
Once that's in place, we want to return or redirect.
So we redirect to get tasks.


@app.route('/delete_task/<task_id>')
def delete_task(task_id):
    mongo.db.tasks.remove({'_id': ObjectId(task_id)})
    return redirect(url_for('get_tasks'))



Why?
Because once that function is complete, we want to see it disappear. We want visual evidence to see that that task is no longer on our list.
So we redirect to the get_tasks function.
It's very straightforward.
Now, you might need to clear your cache here for this to be picked up.
Let's clear the browsing data.
As I said earlier, you can use incognito mode if you wish.
Click done, and that disappears.
So they're marked as complete.
As I mentioned, they're simply just deleted from the database.
In reality, you would come up with a more sophisticated solution than that.
So there we are, task complete.