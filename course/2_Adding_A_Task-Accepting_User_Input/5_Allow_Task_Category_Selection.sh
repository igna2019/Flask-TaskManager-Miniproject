 Allow Task Category Selection


 1-What is it?

A select element

2-What does it do?

An element which will allow a user to select a category from a list of options

3-How do you use it?

You use a combination of a single select element that contains multiple option elements (i.e. one option for each category)


Description

Our form is getting closer and closer to being complete.
What we need to do next is we need to add a select element, which will allow us to choose from the different categories of tasks.
So let's go back to Materialize and choose a select component.

https://materializecss.com/select.html

You can see here the different options that Materialize gives you out-of-the-box.
You can have multiple select, and you can have dividers across select categories.
Let's grab a single select option now.
And we're going to drop that into our form as a test.
Before we go any further, let's wrap it in a row, so it will behave and display correctly.


<div class="row">
      <div class="input-field col s12">
        <select>
          <option value="" disabled selected>Choose your option</option>
          <option value="1">Option 1</option>
          <option value="2">Option 2</option>
          <option value="3">Option 3</option>
        </select>
        <label>Materialize Select</label>
      </div>
    </div>



You can see when we copied across the code, it already had a class of input-field, which styles it in that in that Materialize form style, and by default, it has a col setting of s12.
Let's do a refresh here.
We need some jQuery to initialize this.
And here it is.
It must be placed within a document.ready() function.
Now you remember we already have a ready function for the document element in place, so all we really need is the material_select() function.

 
    $('select').material_select();
 

So let's go back to our base.html and paste it in below our call to the collapsible function.
Save and do a refresh.
And then we'll test again.
Our next step is to wire up the data from our categories collection in MongoDB and dynamically generate an option instance for each category document we have in our collection.
Let's change our icon prefix to pole.


<i class="material-icons prefix">poll</i>

It gives the impression of categories.
You see them in a bar chart there, roughly representing different categories of tasks.
Let's change our label to task category.



<label>Task Category</label>

And then we'll modify our options.
Now, we keep the first option.
That will be outside our loop because we want a disabled selected element to be displayed.
And in our case, it'll be choose category.

<option value="" disabled selected>Choose Category</option>

That will be our first option, and it'll always be there, but it won't be selectable, as it's only a visual clue as to what's expected from the user.
You can see there it's commented out, and the rest are displayed.
We're going to dynamically display our options.
So we will need to bind our category data.
But first, let's clean up our select, give it an ID, and give it a name for our form when this eventually is submitted.


<i class="material-icons prefix">poll</i>
        <select id="category" name="category_name">


Let's then go back to add_task.
Initially, add_task just redirected to the addtask.html.
Now, the naming can be a little bit confusing.
add_task just means display the add task page.
When we want to add a task to the database, we will have a function called insert_task.

@app.route('/add_task')
def add_task():
    return render_template("addtask.html",
    categories=mongo.db.categories.find())

These are our categories. We can see that there's home, work, and music.
And we've used Mongo.
You use the find function with MongoDB to fetch our categories.
And we're passing that back in a categories parameter.
So as I mentioned, we only need one option here.
We need one option in addition to the one that's disabled and selected.

<select id="category" name="category_name">
          <option value="" disabled selected>Choose Category</option>
          {% for cat in categories %}
          <option value="{{cat.category_name}}">{{cat.category_name}}</option>
          {% endfor %}
</select>

But we only need to display one option inside our for loop because, remember, using a for loop in these templated languages allows us to have conditional rendering.
So what that means is the option HTML segment there will be displayed for each instance of a category in the collection itself.
So we have conditional rendering.
If we have four categories, we will have four options. If we have 10 categories, we'll have 10 options, and so on.
We'll use the option value. We'll set the value to the category name.
And we will use the same piece of data to display the category in its listing.
But the value behind the scenes is the data that will be submitted to the form, and not what the user will see.
There we have it.
Home, work and music.
So it's looking good.
We've added a new select, we've bound it using the categories, we've wrapped it inside a for loop, and we are binding the category name to the option value and the display within the option.
Next thing we need to do, then, is add a submit button and the associated insert function over in Flask.
And we will be able to add a new task.
