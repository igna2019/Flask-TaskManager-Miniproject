 Add Task Form Input Fields


 1-What is it?

Input fields


2-What does it do?

Input fields that will ask users for details of the new task


3-How do you use it?
You use the input element


Description

At this point, we have a sample form with two fields.
Let's change the column size of each field from six to 12 so that each form field will take up the full width of the page.
There we have it.

<div class="row">
    <form action=""  method="POST" class="col s12">
      <div class="row">
        <div class="input-field col s12">
          <i class="material-icons prefix">account_circle</i>
          <input id="icon_prefix" type="text" class="validate">
          <label for="icon_prefix">First Name</label>
        </div>
        <div class="input-field col s12">
          <i class="material-icons prefix">phone</i>
          <input id="icon_telephone" type="tel" class="validate">
          <label for="icon_telephone">Telephone</label>
        </div>
      </div>
    </form>
  </div>

Notice our form has got our input text, a label, and an image.
You can see that each one of those elements is wrapped within a div.
And it's the custom class input field, which provides the styling for those.
You'll become more familiar with those as we go through the project.
But let's change the type, type="text", which is given an ID and a name because we want to target these.
We also want to submit these as values of the database, and the easiest way to do that is to match the names for these input fields to the names of the fields in MongoDB.
We'll also change the icons to reflect the kind of information we expect.
So we change the icon to assignment, we change the label to Task Name, and then we move on to the second input field.
We set the name to task_description, again, to match the value of the document property over in MongoDB.
We set the ID to task_description as well.
And we give it some custom classes as provided by Materialize.
Let's change the label for our input field.
We will change it from telephone to Task Description.
The task description is a text area.
Let's change our icon to subject.
Let's see what it looks like.
Refresh.
The text area is off.
We need to use the html5 text area as our element.
Let's close this off and save.

<div class="row">
    <form action=""  method="POST" class="col s12">
      <div class="row">
        <div class="input-field col s12">
          <i class="material-icons prefix">assignment</i>
          <input id="task_name" name="task_name" type="text" class="validate">
          <label for="icon_prefix">Task Name</label>
        </div>
        <div class="input-field col s12">
          <i class="material-icons prefix">subject</i>
          <textarea name="task_description" id="task_description" class="materialize-textarea"></textarea>
          <label for="icon_telephone">Task Description</label>
        </div>
      </div>
    </form>
  </div>



And there we go!



Now you might be wondering what's that green little icon in the bottom right hand corner of the text area.
That's just a grammerly plug-in that I use on Chrome, so don't expect to see that there when you build your own.
Now we're going to split each input field into its own row.
You don't necessarily need to do this because a column width of 12 will occupy the maximum width within a row, and the elements will naturallyk display beneath each other.
But if you do want to add extra elements within that row and play around with the column widths of those elements within the row, then this is a good start.

<div class="row">
  <form action="" method="POST" class="col s12">
    <div class="row">
      <div class="input-field col s12">
        <i class="material-icons prefix">assignment</i>
        <input id="task_name" name="task_name" type="text" class="validate" />
        <label for="icon_prefix">Task Name</label>
      </div>
    </div>
    <div class="row">
      <div class="input-field col s12">
        <i class="material-icons prefix">subject</i>
        <textarea
          name="task_description"
          id="task_description"
          class="materialize-textarea"
        ></textarea>
        <label for="icon_telephone">Task Description</label>
      </div>
    </div>
  </form>
</div>





So we have our task name.
We have our task description.
The next thing we're going to do is we're going to add a checkbox.
Materialize calls them switches, which is a styled checkbox that looks interesting.

https://materializecss.com/switches.html

<!-- Switch -->
  <div class="switch">
    <label>
      Off
      <input type="checkbox">
      <span class="lever"></span>
      On
    </label>
  </div>

It pops a little bit more than a standard checkbox.
So let's pop that in here.
Clean up the formatting in the layout.
Let's take a look at it.
So we've got off and on.
We only want one label.
We only want is urgent.
And we'd like to display it on the right of the checkbox.
So remove the off.
And we change on to is urgent.

<!-- Switch -->
      <div class="switch">
        <label>
          <input type="checkbox" />
          <span class="lever"></span>
          Is Urgent
        </label>
      </div>


And there we go.
By the way, checkboxes will only submit as form data if they're checked.
Let's give it an ID and a name.
The ID is urgent, and we'll give it the name as is urgent as well.
It's common enough to match the name and the IDs of form elements, or form input fields and formats.

<div class="row">
      <!-- Switch -->
      <div class="switch">
        <label>
          <input id="is_urgent" name="is_urgent" type="checkbox" />
          <span class="lever"></span>
          Is Urgent
        </label>
      </div>
    </div>


Next thing we're going to do is we're going to add a date picker.
And why use the date picker?
Again, to create a good user experience for the users.
A date picker allows the user to choose a date in a way that is formatted in an acceptable way for the database.
If we were to allow free text, if we were to allow the user just to type in dates, well, we could have all different formats.
We could have US, we could have non-US, European date formats, and so on.
Databases really hate poorly formatted date strings.

https://materializecss.com/pickers.html

So by using a date picker, the only interaction that a user can have with the date is to select a date from a calendar item.
So let's add our date picker.
So the info type is text, but the class itself is date picker.
Materialize's CSS file will recognize and target that accordingly.
Let's change the icon to today.
And it just shows a little calendar icon.
Again, change the ID and the names to due_date.
And they'll match the MongoDB fields, the key value pairs.
And then change the label to Due Date.
We will also need a bit of jQuery to fire or to trigger the display of the calendar.
You can settle for the default values here, but you could customize them as you see fit.
So let's copy this jQuery.
And we'll put it in our parent template, in base.
That way, all date pickers that we choose to include can be accessed by this trigger function.
There you have it!
We still need to add a select to display the options for the categories.
We also need to add a submit button to submit the form.
And we need to add the corresponding Python functionality to take that form content and insert our form data as a new document into our Mongo DB database.
