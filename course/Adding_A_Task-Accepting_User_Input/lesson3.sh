Add Task Form Boilerplate

1-What is it?

A boilerplate or skeleton form written in HTML

2-What does it do?

The completed form will allow application users to add a new task. The boilerplate form is the HTML code required to generate the form


3-How do you use it?

By creating a skeleton form in a new file called 'addtask.html'


Description

As a reminder, CRUD stands for Create, Read, Update, and Delete.
They're the primary actions that you'll undertake when interacting with the database.
So in our last video, we used the read functionality where we did a find, and we read back all tasks.
Now we're going to use c for create.
So we're going to create data.
We're going to put the user interface elements in place that will allow us to add a new task.
So the first thing we do is we create a new HTML file called addtask.html.

And as with our earlier video, we will create this as a child template of base.html.
So you can see again, we use the extends keyword followed by the name of the HTML page, which is base.
And we put it into {% block content %}, so we'll inject this into {% block content %} when this view is being rendered.
And we're going to keep it simple for now. All we're adding is a <h3>.


addtask.html

{% extends 'base.html' %}
{% block content %}

<h3>Add Task</h3>

{% endblock %}

And let's get rid of the old test function that we used at the beginning of the project.
We're going to create a new function.
And this function is going to be called add_task().
It's singular rather than plural. You'll add one task at a time.
In order to do that, we create a decorator with a route called '/add_task'.
And we create a function with the same name.
You don't have to do this.
You can have your routing identifier can be different than the function name if you want to conceal things like that and make them less obvious.
You don't have to do that, but when you're starting off, it's easier to create a function name with the same name as our task.
There we go.

@app.route('/add_task')
def add_task():
    return render_template("addtask.html")


This function works.
It redirected to the addtask.html page.
What we're going to do now is we're going to use a form because when you want to add a task, the easiest way to do this is to create a HTML form that the user can fill in form elements and submit the form to the server.
So we're going to use Materialize form elements.
They're quite elegant, and they conform to good UX as well.

https://materializecss.com/text-inputs.html

We're going to use a form with icon prefixes.
We'll modify the prefixes to reflect the data that we expect to be filled into these fields in the form.
Again, just like the tasks template, we will copy and paste in a form element as well.
We'll be using text areas in our forms.
We'll also be using a select.
And we use our select for categories.
The categories that we created in MongoDB in the last video will eventually populate the select element with these options.
I'm just showing you here that there are different ways, there are more stylized ways, of representing the selects as well.
So let's grab our sample form.
And we'll paste that into our add_tasks.
Now remember, it must be inside in the {% endblock %}, between the {% block content %} and {% endblock %}.

addtask.html

{% extends 'base.html' %}
{% block content %}

<h3>Add Task</h3>

<div class="row">
    <form class="col s12">
      <div class="row">
        <div class="input-field col s6">
          <i class="material-icons prefix">account_circle</i>
          <input id="icon_prefix" type="text" class="validate">
          <label for="icon_prefix">First Name</label>
        </div>
        <div class="input-field col s6">
          <i class="material-icons prefix">phone</i>
          <input id="icon_telephone" type="tel" class="validate">
          <label for="icon_telephone">Telephone</label>
        </div>
      </div>
    </form>
  </div>

{% endblock %}


Now notice here, similar to the Bootstrap you would have used in earlier lessons, Materialize uses the grid system.
So a grid system is based on on 12 columns.
It's a 12 column grid system.

<form action=""  method="POST" class="col s12">

So you can see that in our divs for each element there, we have two fields.
One uses an s6, and the second uses an s6 as well.
One of the input fields takes up six columns, and the second one takes up six columns as well.
You'll play with those to align them in a way that suits you.
We've saved our changes, so we now run our code.
We can see that we are redirected to the add task page.
And we do have two input fields in a form.
Now, we've no way of submitting it yet, and we don't have our actual data in place.
We'll do that next.

how it ends the file 

addtask.html

{% extends 'base.html' %}
{% block content %}

<h3>Add Task</h3>

<div class="row">
    <form action=""  method="POST" class="col s12">
      <div class="row">
        <div class="input-field col s6">
          <i class="material-icons prefix">account_circle</i>
          <input id="icon_prefix" type="text" class="validate">
          <label for="icon_prefix">First Name</label>
        </div>
        <div class="input-field col s6">
          <i class="material-icons prefix">phone</i>
          <input id="icon_telephone" type="tel" class="validate">
          <label for="icon_telephone">Telephone</label>
        </div>
      </div>
    </form>
  </div>

{% endblock %}