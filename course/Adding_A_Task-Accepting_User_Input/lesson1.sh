 Accordion Task Data Binding

 1-What is it?

Binding data from our database to our accordion feature

2-What does it do?

It creates a collapsible header for every task in the database. The collapsible header will display the task name and when a user clicks on it they will be able to view the task description

3-How do you use it?

You dynamically generate a list item for every document (i.e. a task) returned from the database


description

We now have our accordions in place.
And the accordions contain sample data, such as some lorem ipsum and so on.
We're going to replace that with some actual dynamically generated data from the database.
Now in this case, we only have one record, but that will build over time.
So an accordion is really a stylized unordered list with list items.
So what we're going to do is we're going to dynamically generate a list item in a list for every record returned, or every document returned, from the database.
We use a for loop.
Again, for task in tasks.
So we can reuse the jinja functionality that we created earlier.
And we're going to wrap a list item in the for loop.
What we're getting there is a kind of conditional rendering.
You'll get an instance of a list item for every record represented in the database or that's returned based on a particular search.
And for each instance, we will display the task name.
Beside that, we will display the task header.
So these will appear in the collapsible header, or the accordion header.
And when you expand the accordion element, we have a div and a span.
And let's replace the lorem ipsum with the task description.
This conditional rendering is quite common across all templated frameworks.
Angular uses it, React can use it, Vue can use this, Django can use this.
So once you get a sense of one of the frameworks, it's very easy to transition to another framework type.

task.html

{% extends 'base.html' %}
{% block content %}
    
           

    <ul class="collapsible" data-collapsible="accordion">
        {% for task in tasks %}
        <li>
            <div class="collapsible-header"><i class="material-icons">filter_drama</i>{{task.task_name}} - {{task.due_date}}</div>
            <div class="collapsible-body"><span>{{task.task_description}}</span></div>
        </li>
        {% endfor %}
    </ul>
{% endblock %}

There we go, Buy Detergent.
Now notice the icon on the site doesn't really suit.
It's a cloud, so we'll create a custom one.
And what we're going to look for is an icon that gives a visual clue to the user that more information is available and that if they expand, they'll see a task description.
So we're going to go to material icons.
And we're going to search for an appropriate icon.
You can see there that the icons are broken into different categories.
As I mentioned in an earlier video, it's not as rich as Font Awesome, but it's still pretty comprehensive.
We're looking for an expand icon.
Notice that these icons are represented in an <i> tag, which used to be italics.
Italics is no longer the preferred way of representing italicized text.
We use em for emphasis now.
So that's why this slightly deprecated tag has become commonly used with icons.
So it's no longer i for italics.
It's i for icon.

 <div class="collapsible-header"><i class="material-icons">expand_more</i>{{task.task_name}} - {{task.due_date}}</div>


We've swapped it in.
The user now is given a visual clue as to the fact that there is more information available if they click on this element.
Last thing we'll do, then, is we'll make it strong so that the task name is more emphasized.
And there we go. We have our task list.


task.html


{% extends 'base.html' %}
{% block content %}
    
           

    <ul class="collapsible" data-collapsible="accordion">
        {% for task in tasks %}
        <li>
            <div class="collapsible-header"><i class="material-icons">expand_more</i> 
            <strong> {{task.task_name}} - {{task.due_date}}</strong>
            </div>
            <div class="collapsible-body"><span>{{task.task_description}}</span>
            </div>
        </li>
        {% endfor %}
    </ul>
{% endblock %}



base.html

<!DOCTYPE html>
<html>
  <head>
    <link
      href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet"
    />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/css/materialize.min.css"
    />
  </head>
  <body>
    <h1>Outside!</h1>
    {% block content %} {% endblock %}
    <script
      src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"
      integrity="sha512-3P8rXCuGJdNZOnUx/03c1jOTnMn3rP63nBip5gOP2qmUh5YAdVAvFZ1E+QLZZbC1rtMrQb+mah3AfYW11RUrWA=="
      crossorigin="anonymous"
    ></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/js/materialize.min.js"></script>
    <script type="text/javascript">
      $(document).ready(function () {
        $(".collapsible").collapsible();
      });
    </script>
  </body>
</html>
