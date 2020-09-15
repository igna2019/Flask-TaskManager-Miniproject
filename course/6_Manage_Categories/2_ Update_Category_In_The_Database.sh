 Update Category In The Database


 1-What is it?

A button called Edit Category and a function called update_category()

2-What does it do?

When a user clicks the Edit Category button on the form, the update_category() function will run. This will edit the Category text in the Database

3-How do you use it?

You create your update_category() function in app.py and wire this up to your Edit Category button


Description



We've added the edit and delete buttons to our category list.
Let's wire up the edit button.
In order to do that, what we need to do is create a view that, when the button is clicked, that view will be displayed, and in that view will be a single form field displaying the category.
It allows us to edit that.
Once we have made a change, that edit is written to the database, and we're redirected back to the categories listing again.
It's the very same pattern as used for tasks.
Once you edit or add a new task, you are redirected back to the tasks list.


categories.html

 <a href="{{url_for('edit_category', category_id=category._id)}}"
          class="waves-effect waves-light btn btn_small blue"
          >Edit</a>        >


So in order to do that, we use our url_for to point to the appropriate function in app.py.
Notice there, we changed it from update to edit.


@app.route('/edit_category/<category_id')
def edit_category(category_id):
    return render_template('editcategory.html', 
        category=mongo.db.categories.find_one({'_id': ObjectId(category_id)}))



Edit category will be used to take the viewer to an editable page.
Update category will be used to carry out the actual update on the database.
What do we need to display that category? We need the category ID passed into the function.
We'll name our function.
We'll give it the same name as the route.
You don't have to do that because URL for points to the name of a function, not the name of the route.
But for simplicity's sake, we will just give the function the same name as the route.
Don't forget to pass in the category_id as a parameter because we'll use this to search for that document and pass it over to our editcategory.html page.
How do we get it over there?
We pass it over as a parameter called category, not categories, because it's a single category for editing.
We refer to the categories collection.
The function we use is find_one.
So its job really is to pass the user to a new view, while at the same time obtaining the category document from the database for editing.
Pass in the category_id. Make sure it's in the format that's acceptable to Mongo.
Let's just do a little bit of pep 8 cleaning here as well.
I've just added an editcategory.html view.
What we're going to do is we're going to take the edit task functionality, copy that, and paste it into our editcategory.
Then trim back the form items that we don't need, similar to what we did with the categories listing when we copied and pasted from the tasks listing, so it's all about reuse.
So let's change Edit Task to Edit Category.
Really what we're going to do here is we're going to strip out the unnecessary form fields until we're left with one.
We don't use a select for editing. We just use a text input field to display that in order to easily edit it.
Just collapse the field items here.
We are going to delete the select.
We're also going to delete all but one of the other input fields.
We're going to keep the button because we need that to trigger the update.
Change the value to category.category_name, not task_name.
So we're simply reusing an input field that was used in the Edit Task form.
Let's change the IDs and the name attributes as well for form submission.
Change the label to Category Name.
Change the prefix to poll because that matches the icon beside the select in our tasks.

editcategory.html

{% extends 'base.html'%}

{% block content %}
<h3>Edit Category</h3>
<div class="row">
    <form action="{{ url_for('update_category', category_id=category._id) }}" method="POST" class="col s12">
        <div class="row">
            <div class="input-field col s12">
                <i class="material-icons prefix">poll</i>
                <input id="category_name" name="category_name" type="text" class="validate" value="{{category.category_name}}">
                <label for="category_name">Category Name</label>
            </div>
        </div>
        <div class="row">
            <button class="btn waves-effect waves-light" type="submit" name="action">Edit Category
                <i class="material-icons right">playlist_add</i>
             </button>
            
        </div>
    </form>
</div>
{% endblock %}


We have an error.
Our end block is missing.
Let's go back to our template and make sure there's an end block included in there.
We can see there that it's displaying the correct category.
Now what we don't have in place yet is the ability to wire it up.
Let's change the button name to Edit Category.
Then we'll go and wire up the Edit Category.
Then we go back and wire up the actual update itself.
Looks good so far.
Now we have edit category.
We'll now create an update category function that will actually write to the database.
Let's add our app.route decorator.
The name of this route will be update_category.
The submit button will call this function.
We need the ID to target the correct document over in the database.
Create our function. Let's call it update_category.
Pass in the category_id as a parameter for use in the update call.
Let's get our categories collection from Mongo using the syntax, again, mongo.db.categories.
Now we call update.
We identify the ID and also the field that we want to update.
In our case, there is only one field to update, and that's category name.
Again, format the ID.
Don't forget your comma.
Create a second curly brace set.
Identify the key in the document.
Don't forget a colon followed by the form.
Because this is a post, again, we specify the method as being POST.
Our http method is POST.
Then let's pass in the request object.
Drill into the form that's contained within the request object.
Refer to the form item, whose name is category_name.



@app.route('/update_category/<category_id>', methods=['POST'])
def update_category(category_id):
    mongo.db.categories.update(
        {'_id': ObjectId(category_id)},
        {'category_name': request.form.get('category_name')})
    return redirect(url_for('get_categories'))



Once that's done, we want to return to categories.
So we'll do a return render.
We'll use the get categories function to redirect us back to the categories section.
By doing that, we do another read from the database, which will display the newly modified category name.
Let's do an edit.
Let's change music to say home again.
Then we select edit category.
There we see it, so our Edit Category works.