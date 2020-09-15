Add Category

1-What is it?

A button called Add Category and a function called add_category()


2-What does it do?

When a user clicks the Add Category button, the add_category() function will run. This function will provide the user with a form to save a new category to the database


3-How do you use it?

You create your add_category() function in app.py and wire this up to your Add Category button



Description


We now have the Edit Category wired and the Delete Category wired. Now, let's Add A Category
Let's create a new template called addcategory.html, and what we're going
to do is, we're going to take the contents of editcategory.html.
Copy that and paste it in to the addcategory.html template because the
functionality and the layout for both. Add and Edit is very similar. Let's clean
up some extra tabs here, and let's change our form action. We'll change it to
insert_category. We can remove the category_id, because we don't yet have one;
we're in the process of creating a new category at this point. Remove the
default values from the edit functionality, so that frees up
the text input field to be empty. Change the text on the bottom to Add Category
and then we before we go over, let's change our heading to Add Category.

addcategory.html

{% extends 'base.html'%}

{% block content %}
<h3>Add Category</h3>
<div class="row">
    <form action="{{ url_for('insert_category') }}" method="POST" class="col s12">
        <div class="row">
            <div class="input-field col s12">
                <i class="material-icons prefix">poll</i>
                <input id="category_name" name="category_name" type="text" class="validate" ">
                <label for="category_name">Category Name</label>
            </div>
        </div>
        <div class="row">
            <button class="btn waves-effect waves-light" type="submit" name="action">Add Category
                <i class="material-icons right">playlist_add</i>
             </button>
            
        </div>
    </form>
</div>
{% endblock %}







Go to app.py. Now let's create the corresponding function at this point, and add our routing.
Okay. It'll be insert_category.
No need for an ID at this point, remember, because the category doesn't yet exist.
But, we do need to specify our HTTP methods value and, as per usual, we use POST.
Let's access our Mongo database in preparation for the insert.
So, categories = mongo.db.categories
Okay, let's use this cursor and we're going to create another variable called category_doc
Which will be equal to a new BSON formatted document - which, remember,
is more or less JSON anyway! Let's get the request.form.
And, let's get the form field, which is category_name.
Okay, then we add the category_doc into the categories table - our collection - and
then return a redirect back to
categories. Which, is just get_categories
That's the function that we're targeting.
So, that will ultimately do the insert,


@app.route('/insert_category', methods=['POST'] )
def insert_category():
    categories = mongo.db.categories
    category_doc = {'category_name': request.form.get('category_name')}
    categories.insert_one(category_doc)
    return redirect(url_for('get_categories'))





 but we need to have the
function that render the view that allows us to add a new
category in the first place. So, let's do that now.
Add our route: new_category.
To be consistent we could have called that add_category
to be consistent with add_tasks You can change that out if you
want to. Just make sure if you do that you change it in the appropriate places
where it's being called. Okay, new_category just simply returns a render
template, which is a rendering of a view.



@app.route('/add_category')
def add_category():
    return render_template('addcategory.html')



By the way, a template is another name for a view. Now we need to
add a button to our our categories list. We're going to add that button, but
beneath our categories list. So, we go back to the categories page - or template
or view - and we're going to add a button. Now, notice this button isn't inside in a
form because we're not submitting a form. We're just clicking on a button and
redirecting to another resource. So, we use a standard anchor tag here
rather than the button. As a challenge, you can also do something similar in the
tasks list which will allow you to add a task directly below the task list rather than
using the menu bar.
We need a href, so we need a location for this anchor tag. And, the URL that we'll
use will be new_category.
Let's just clean this up a little bit,
change the text on the button to Add Category. Run it. Hmmm, that looks odd. Let's
go back. Ah! It should be playlist_add rather than add_playlist. So, refresh. Okay,
so we now we have the ability to add a category. We need the category list and
there we have it: add category!

categories.html

<div class="row">
  <a href="{{url_for('add_category')}}" class="waves-effect waves-light btn"
    ><i class="material-icons right">playlist_add</i>Add Category</a
  >
</div>
