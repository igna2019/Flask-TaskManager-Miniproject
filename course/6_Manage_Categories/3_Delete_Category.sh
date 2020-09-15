Delete Category

1-What is it?

A button called Delete Category and a function called delete_category()


2-What does it do?

When a user clicks the Delete Category button, the delete_category() function will run which will delete the category from the database


3-How do you use it?

You create your delete_category() function in app.py and wire this up to your Delete Category button


Description


Our edit category is now in place.
Let's implement the delete category functionality.
So let's grab our href from the edit and reuse that for the delete.
All we need to do is change the function name in the url_for.
So let's call that delete_category.
It will need the ID because you need to know which category to delete.
So let's create the corresponding function with the route containing delete_category.

category.html

div class="row">
  <h3>Categories</h3>
  <ul class="collapsible" data-collapsible="accordion">
    {% for category in categories %}
    <li>
      <div class="collapsible-header">
        <a
          href="{{url_for('delete_category', category_id=category._id)}}"
          class="waves-effect waves-light btn btn_small"
          >Del</a
        >
        <a
          href="{{url_for('edit_category', category_id=category._id)}}"
          class="waves-effect waves-light btn btn_small blue"
          >Edit</a>

        <div class="task_header col s9">
          <strong> {{category.category_name}}</strong>
        </div>
      </div>
    </li>
    {% endfor %}
  </ul>
</div>
{% endblock %}






Pass in the category_id.
Create a function with the same name.


@app.route('/delete_category/<category_id>')
def delete_category(category_id):
    mongo.db.categories.remove({'_id': ObjectId(category_id)})
    return redirect(url_for('get_categories'))


Pass in the category_id as a parameter to be used to locate and remove that category document from the categories collection.
mongo.db.categories.remove
And all we need here is the ID.
Pass that into the formatting object.
Then redirect back to the get_categories() function, which, again, once called, will make a call to the categories collection and return what categories are left in the database.
Let's test our functionality.
Let's delete the homely category.
Hit delete.
Redirect it back.
Category gone.
Perfect!
