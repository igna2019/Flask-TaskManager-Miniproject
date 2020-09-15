Adding Edit And Done Task Buttons

1-What is it?

Edit and Done buttons


2-What does it do?

The buttons will provide a link to a form where a user can edit a task or mark it as done


3-How do you use it?

You create anchor elements in your HTML and then style those elements as buttons using CSS


Description

We'd like the ability to edit a task or mark a task as complete on our task list, on the accordion of tasks.
Let's do that now.
Currently, we have the accordion expanding elements.
Beside the expand chevron, we'd like to be able to give the user the option to mark a task as complete or mark it for editing.
Let's create a div, and we are going to add some buttons into this.
We're going to use the grid system to allot a certain number of columns for the buttons and a certain number of columns for the description of the task and its due date.
So in the first column grouping, which will be three columns wide, we will add our expand more.
And in the second grouping, we will add the task name and the task due date.

tasks.html

<div class="collapsible-header">
      <div class="col s3">
        <i class="material-icons">expand_more</i>
      </div>
      <div class="col s9">
        <strong> {{task.task_name}} - {{task.due_date}}</strong>
      </div>
    </div>

Inside there, we're also going to add some buttons.
Just do a check once you do an edit.
Once you move or play around with your code, just do a check just to make sure that the layout is still as you'd expect.
Then we go back to buttons.

https://materializecss.com/buttons.html


And instead of a submit button, we just use a style button here, which is really a link.
It's an anchor that has been styled.
We're going to grab that styled component, and you use it for submitting a task and also editing a task.
We'll call one edit, and we'll call the other one done.
So task done and edit.
Save our changes and view.
<div class="col s3">
        <i class="material-icons">expand_more</i>
        <a class="waves-effect waves-light btn ">Done</a>
        <a class="waves-effect waves-light btn ">Edit</a>
</div>

And you can see there, the buttons are quite bulky.
And that's as small as they they come out of the box, unless we apply custom styles.
That's why we created our static directory with our styles in the last video, so we can make them more presentable.
So let's now go to our style.css.
Let's create a class called btn.small.
We'll give it a height of 24px.
We'll give it a width of 60px.


We'll give it a line height, again, of 24px.
And let's give it some margin.
We give it some margin to give it some breathing space.
It's actually to push each button away from each other.
So left, right, top, and bottom will be 5px.
So as a result, there will be a 10px distance between each button.
Let me give it some padding.


.btn_small{
    height: 24px;
    width: 60px;
    line-height: 24px;
    margin: 5px 5px;
    padding: 0 0.5px;
}

Let's get rid of our test style.
Ignore the warning there. It's just advice.
Let's paste in the style name.

<a class="waves-effect waves-light btn btn_small">Done</a>
 <a class="waves-effect waves-light btn btn_small">Edit</a>

Let's see if it works. Do a refresh, and you can see, there it is. It's working.
We'd also like to change the colors, again, to provide as much visual clues as you can to the user.
We can use default colors that are provided by Materialize.
Of course, these can all be overridden and customized in your own styles, but for simplicity, we'll just use blue for edit, and we'll leave green for done, which is the default.

<a class="waves-effect waves-light btn btn_small">Done</a>
<a class="waves-effect waves-light btn btn_small blue">Edit</a>


We're also going to provide some custom styling for our task header, which currently contains the task name and the due date.
When it's 5px margin-top, that's to align it with the buttons because it's slightly off.

.task_header{
    margin-top: 5px;
}

It's slightly above center with the buttons themselves.

<div class="col task_header s9">
        <strong> {{task.task_name}} - {{task.due_date}}</strong>
</div>


Do a refresh.
That should be better.
You can also see here that because of the use of columns, the 3 and the 9, we get a nice responsive display on a smaller form factor, such as a mobile device.
Finally, let's wrap our content in a container.

base.html

 <div class="container">
    {% block content %} {% endblock %}
    </div>

And just as with Bootstrap, Materialize uses a container.
If you wrap the outermost div in a container, it makes more presentable.
