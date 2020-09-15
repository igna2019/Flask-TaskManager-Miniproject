Bind Data To Edit Task Form

1- What is it?

Input fields

2- What does it do?

Input fields that will allow users to update the details of an existing task

3-How do you use it?

You use the input element


Description

We're nearly there with our edit task functionality.
What we need to do next is we need to display the task elements in the form for editing when this view is displayed to the user.
All of these need to be filled in.
Let's start with the select.
The first thing we want to do is we want to display by default the category name selected in the original task creation.
We're going to use a for loop, and we're going to use an if statement.
As we loop through the categories, if the category name matches the category name associated with this particular task, then we set that as selected.
And if the category name doesn't match the task category name, then we simply display an option without the selected attribute included.
It's a very simple use of boolean checks.
If we find a match, then we add a selected attribute.
Otherwise, we don't have a selected attribute.
Let's not forget to close our block.
So if it's true that the category name is equal to the task category name, we generate an option value with the category name displayed.
What's unique to that option is that the selected attribute will be included.
Because we're only using a single select, there should only ever be one match.


edittask.html

{% for cat in categories %}
            {% if cat.category_name == task.category_name %}
          <option value="{{cat.category_name}}" selected >{{cat.category_name}}</option>
            {% else %}
          <option value="{{cat.category_name}}" >{{cat.category_name}}</option>
            {% endif %}
{% endfor %}


As a reminder of where this data comes from, let's go back to our app.py and look at the function.
You can see in edittask that task is passed across as well as the categories.

@app.route("/edit_task/<task_id>")
def edit_task(task_id):
    the_task = mongo.db.task.find_one({"_id":ObjectId(task_id)})
    all_categories = mongo.db.categories.find()
    return render_template('edittask.html', task=the_task, categories=all_categories)

That allows us to match the category that's associated with task with the general list of categories.
There we can see our categories are available to us, and a selected category for that task was displayed by default.
Next, let's bind the rest of our data to the form.
So the task name, for example, the input, we're going to set the value (value="{{task.task_name}}" />)of that task name to the task name associated with the task being passed across from the function.

edittask.html

<div class="row">
      <div class="input-field col s12">
        <i class="material-icons prefix">assignment</i>
        <input id="task_name" name="task_name" type="text" class="validate" value="{{task.task_name}}" />
        <label for="icon_prefix">Task Name</label>
      </div>
    </div>


Refresh.
There it is.
We'll do the same with our description. ({{task.task_description}})


edittask.html

<textarea
          name="task_description"
          id="task_description"
          class="materialize-textarea"
        >{{task.task_description}}</textarea>

Let's pop that in there.
We'll leave the due date unitl last because it requires an extra bit of work.
But let's work on the is urgent display for now.
Similar to what we did when displaying the options in the select, we use an if statement here as well.



          {% if task.is_urgent %}
          <input id="is_urgent" name="is_urgent" type="checkbox" checked/>
           {% else %} 
          <input id="is_urgent" name="is_urgent" type="checkbox"/>
           {% endif %}


If the task is urgent, and that's what's called truthy, it'll either return true or false.
So if it's true that the task is urgent, then use the checked attribute.
And if it's not, then we don't.
And it's as simple as that.

You see there that if it's urgent, use the checked attribute.
If it's not urgent, then omit the checked attribute.
Lastly, we will work with our due date.
To bind the due date associated with the task to the field, we need to work with a bit of jQuery.
In particular, we do need to reuse our jQuery import down at the level of edit_task.
For some reason it's not binding.
It's a bug.
It's not binding from the parent template, so we just need to include that script in our edit_task.
And we're going to create a bit of JavaScript that will allow us to work with the date picker.
We use the $
Remember, the $ lets you know that you are using jQuery.
And we focus on the document element.
And we're using the ready function.
I suppose it's the ready method, really, if it's associated with an object and a class.
Inside here, we're going to use an anonymous function.
And we're going to target our due date component.
We need to do a bit of formatting first.
We need to parse our date associated with this task into a format that the date picker understands.
So we now have a local variable called due_date.

edittask.html

<script
  src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"
  integrity="sha512-3P8rXCuGJdNZOnUx/03c1jOTnMn3rP63nBip5gOP2qmUh5YAdVAvFZ1E+QLZZbC1rtMrQb+mah3AfYW11RUrWA=="
  crossorigin="anonymous"
></script>
<script type="text/javascrip">
  $(document).ready(function(){
          due_date = Date.parse('{{task.due_date}}')
      });
</script>

Don't confuse the variable on line 68 with the ID of the component.
They are separate things.
That's a local variable that just happens to have the same spelling.
The due date we are referring to in here should be the ID of the due date we are referring to in line 69.
It's not the same value as the variable on line 68.


$('due_date').pickdate

So we're chaining some functions here.
We're saying ID called due date, get the pick date called picker, and set our selected date as the due date we just formatted there online 68.
So it's a key value pair that's selected.
You use the Select keyword to select a particular date, and the due date that we're passing it in is the due that we formatted on line 68.
I'm also specifying the format dd/mm/yyyy
We're also setting an event trigger of change.
So we need this, but why are we doing this?
We're doing this to inject the due date into the form field associated with that date picker.

$(document).ready(function(){
          due_date = Date.parse('{{task.due_date}}');
          $('#due_date').pickdate('picker').set('select', due_date, {format: 'dd/mm/yyyy'}).trigger('change')
      });
It's failing.
There's a bug somewhere. Let's see where our bug is.
Let's have a look at the component and look at the ID.
We're missing the #.
The only time that you're allowed to omit either a # or a full stop is if you're targeting a built-in component, such as a paragraph or header.
Due date is not one of those.
That's why you need the #, so we can target the correct ID.
Finally, the last thing we need to do in terms of displaying the data for edit is to change the text of the button from add task to edit task.