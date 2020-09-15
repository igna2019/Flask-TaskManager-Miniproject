 Display Categories

 1-What is it?

get_categories() function

2-What does it do?

Reads in a list of the categories from the database and displays them to a user on a 'categories.html' page


3-How do you use it?

You create your get_categories() function in app.py and wire this up to your 'categories.html' template


Description


It's always a good idea in coding to reuse patterns or actual code again and again.
It provides consistency to your projects.
So in order to display our categories, we are going to reuse most of the functionality that displays our list of tasks.
As with a task, you can edit and delete a category, as well as add a new category.
So we create a new categories template called categories.html.
We are going to copy the tasks content.
We'll paste it into categories, and we'll modify it.
The main difference here is there won't be any expansion on the accordion because there's no additional information required for the category, just the category name.
Just clean up our code here.
Again, we have a h3 for categories.
We could put that outside the row, but because a header is a block level element, it will automatically occupy the full width of the available space on the browser and force any subsequent content down onto a new line.
And in this case, instead of looping through a list of tasks, we're going to loop through a list of categories.
So we change our for loop to look for the category collection.
We change that from task to category_name.
We don't need a due date anymore.
And we don't need the details, the description.
So we are cheating a little bit here.
We don't necessarily need a collapsible header.
There are cards that we could use from Materialize, but because we have that pattern in place already and the shape looks similar, we're reusing it.
We're repurposing our collapsible accordion in a way that they just don't collapse.
We don't need our chevron because we don't need to expand further.
Let's clean up some white space.
And let's check that our divs are in place.
That's one of the gotchas when removing HTML elements.
Just make sure you don't leave any stray closing tags for elements.
It happens all the time.
And one way of ensuring that is to make sure your indentation is in place.


categories.html

{% extends 'base.html' %} {% block content %}

<div class="row">
  <h3>Categories</h3>
  <ul class="collapsible" data-collapsible="accordion">
    {% for category in categories %}
    <li>
      <div class="collapsible-header">
        <a
          href=""
          class="waves-effect waves-light btn btn_small"
          >Del</a
        >
        <a
          href=""
          class="waves-effect waves-light btn btn_small lue"
          >Edit</a
        >

        <div class="task_header col s9">
          <strong> {{category.category_name}}</strong>
        </div>
      </div>
    </li>
    {% endfor %}
  </ul>
</div>
{% endblock %}





That will give you a visual idea of determining whether everything is in place or not.
So then we create a get_categories() function.
Its job is to do a find on the categories table.
Again, we'll shortcut this.
So categories.html is the template we're going to render.
And our categories parameter will feed that from a direct call to MongoDB.
So Mongo.db.categories.find.
If you do find yourself coding in other languages later on in your career, you'll really appreciate how succinct and neat and terse Python can be in terms of getting things done.
In other languages, that could take 8 or 9 lines of code.
We have old stray functions, so let's get rid of those.
There we go.
We can see our categories are in place.
Let's do another little bit of cleanup on our HTML, which will take us to delete, edit, and, eventually, add a category.