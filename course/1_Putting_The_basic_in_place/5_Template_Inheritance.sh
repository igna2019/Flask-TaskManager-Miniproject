Template Inheritance

1-Parent and child HTML templates
2-The child template inherits HTML code from the parent template. This follows the philosophy of 'DRY - Don't Repeat Yourself' as templating helps you avoid duplication
3-You use jinja blocks to inject content e.g.
{% block content %} *Insert content here* {% endblock %}

Description

We now have our Mongo database wired up to the Flask application, and we are in a position now where our documents are displaying on the screen via the template, although we only have one documented at this point.
So let's do a little bit of refractoring.
And what we're going to do is we're going to create a parent template for all of our views, or our templates (i.e. the HTML files).
And to do that, we're creating a new file called base.html.
And that document, or that web page, will contain our references to our JavaScript, our CSS, and our third-party libraries that we'll use across the application.
Now, there will be exceptions to this as well wherever we need to add specific functionality to a child template.
We will add that there as well.
But in general, this acts as a one-stop shop that neatly provides access and visibility to our JavaScript files, our CSS, and our navigation.
The point of the template is that you don't have to repeat yourself.
That is a philosophy within framework development: DRY, don't repeat yourself.
And in order to inject the child content, we create an opening and a block tag.
And the block keyword is required, but in this example, we see the word content, or the string content.
You can use other names for that.
It's a convention to use the word content, but you can use others.
And we'll see how that works in a few moments.
But I've also added a <h1> tag outside, just to prove that we can see material, markup, or functionality outside the child tags and within the parent tag.

base.html

<!DOCTYPE html>
<html>
    <head></head>
    <body>
        <h1>Outside!</h1>
        {% block content %}
        {% endblock %}
    </body>
</html>


So for the child tag to inherit correctly from the parent, we remove the HTML elements, e.g. HTML, the body, the head, and HTML tags themselves.
And we replace that with another jinja block.
So we use the extends keyword followed by the name of the parent template from which we want to inherit and that we want to inject into.
And then we specify the data that will be injected into the parent.
So in order to do that, we repeat the syntax.
Again, this {% block content %}
And then we close it with an end block.

tasks.html

{% extends 'base.html' %}
{% block content %}
    {% for task in tasks %}
        {{task.task_name}}
        {{task.category_name}}
        {{task.task_description}}
        {{task.is_urgent}}
        {{task.due_date}}
    {% endfor %}
{% endblock %}

If we don't specify the word content in this case, it won't be displayed because the parent is looking for that.
It's looking for content or data within a block that has that identifier.
So content is just an identifier for that particular block.
We run it, and you can see Outside!
The mark-up has been merged, so the parent template is displaying Outside!, and the child template is displaying the record retrieved from the database.
And this is all achieved using the block tags.
So you have an opening and a closing tag.
Let's change our keyword content to something else.
For example, let's call it stuff.
We change it here.
We run it.
This is to see our content.
So the keyword content, or the identifier, is a convention.
But you must be consistent in the parent and the child elements.
In this case, we changed one back to content and left the other as stuff, and it failed.
So it silently fails there.
Just keep an eye out for those kind of errors.
They won't show up as code failures, but they can be frustrating.
Here we go!
So there we have it.
Our parent child template is in place.