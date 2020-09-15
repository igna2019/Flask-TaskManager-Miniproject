Accordion Setup

1- What is it?

A Materialize component

2- What does it do?

It provides an accordion-style feature which expands and contracts when you click on an element. It is commonly used to show and hide more detailed information about a topic


3- How do you use it?

You include the source code for the component named 'Collapsible HTML Structure' in your HTML file


Description

At this point, we have our Materialize imports, our CDN links, our external links, to CSS in place.
We also have our JavaScript, we have our jQuery, and we have our icons in place.
So now let's use one of the components.
And we're going to use what Materialize calls collapsible, which is just a custom name for an accordion.
An accordion expands and contracts when you click on elements of that, so it reveals more detailed information.
And we're using that to display our tasks.
So in the accordion header, or the collapsible header, we'll see the task name and the due date.
And once expanded, we will display the description associated with that task.
As a challenge, you can go further and display more information, such as is if the task is urgent and also the category of that task.
But for now, we're going to keep it simple.
We're going to display the task name, the task due date, and, when expanded, that accordion node will display the task description.
So we copy and paste.

https://materializecss.com/collapsible.html

And for now, we will paste it within the block tags.

{% extends 'base.html' %}
{% block content %}
    {% for task in tasks %}
        {{task.task_name}}
        {{task.category_name}}
        {{task.task_description}}
        {{task.is_urgent}}
        {{task.due_date}}
    {% endfor %}

    <ul class="collapsible" data-collapsible="accordion">
        <li>
            <div class="collapsible-header"><i class="material-icons">filter_drama</i>First</div>
            <div class="collapsible-body"><span>Lorem ipsum dolor sit amet.</span></div>
        </li>
        <li>
            <div class="collapsible-header"><i class="material-icons">place</i>Second</div>
            <div class="collapsible-body"><span>Lorem ipsum dolor sit amet.</span></div>
        </li>
        <li>
            <div class="collapsible-header"><i class="material-icons">whatshot</i>Third</div>
            <div class="collapsible-body"><span>Lorem ipsum dolor sit amet.</span></div>
        </li>
    </ul>
{% endblock %}
Remember, if you paste it outside of the block tag, it won't be displayed when the parent and child templates render.
So let's just copy it and paste as is.
And we can see our collapsible elements are in place.
Now, they're not firing yet because they need a bit of JavaScript to initialize it.
So we use the jQuery document.ready() function.
So this function will be called when the document is ready.
That means when all the elements, the HTML elements, have rendered.
So we'll place this in the base.html in the parent template so that any collapsible elements can access this functionality when they're being rendered.
Do a refresh.
And there we go.
So we now have our accordion in place.
What we'll do next is we will dynamically add tasks to those accordion elements.


task.html

{% extends 'base.html' %}
{% block content %}
    {% for task in tasks %}
        {{task.task_name}}
        {{task.category_name}}
        {{task.task_description}}
        {{task.is_urgent}}
        {{task.due_date}}
    {% endfor %}

    <ul class="collapsible" data-collapsible="accordion">
        <li>
            <div class="collapsible-header"><i class="material-icons">filter_drama</i>First</div>
            <div class="collapsible-body"><span>Lorem ipsum dolor sit amet.</span></div>
        </li>
        <li>
            <div class="collapsible-header"><i class="material-icons">place</i>Second</div>
            <div class="collapsible-body"><span>Lorem ipsum dolor sit amet.</span></div>
        </li>
        <li>
            <div class="collapsible-header"><i class="material-icons">whatshot</i>Third</div>
            <div class="collapsible-body"><span>Lorem ipsum dolor sit amet.</span></div>
        </li>
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


