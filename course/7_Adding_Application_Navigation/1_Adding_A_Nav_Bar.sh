Adding A Nav Bar


1-What is it?

Nav bar


2-The Nav Bar provides users with the necessary links to navigate your application and to perform any CRUD operations (e.g. create, edit or delete tasks and categories)


3-How do you use it?

You refactor the source code for a Materialize Nav Bar component to include the relevant links to your HTML templates




Description


So we have all of our CRUD functionality in place. We can create a task, we can create a category, we can read tasks, we can read categories.
We can update tasks, we can update categories, and we can delete tasks and categories.
All we need to do now is to put some top-level navigation elements on our application.

https://materializecss.com/navbar.html


grab nav bar

<nav>
    <div class="nav-wrapper">
      <a href="#" class="brand-logo">Logo</a>
      <ul id="nav-mobile" class="right hide-on-med-and-down">
        <li><a href="sass.html">Sass</a></li>
        <li><a href="badges.html">Components</a></li>
        <li><a href="collapsible.html">JavaScript</a></li>
      </ul>
    </div>
  </nav>


Go to base.html >


In the spirit of semantic markup, we've created a header element.
We then go across to Materialize and grab a nav bar.
You can see that it's already encased in a nav element as well.
Let's grab that and paste it into our header.
Just clean it up a bit, and let's test it.
We should first change the logo to Task Manager.
There we go!
So we have a little bit of work to do to this. We want to make it responsive.
You can see here that the navigation elements disappear, and we need to fix that.
Let's go back to Materialize.
We're going to grab another unordered list.
This unordered list will be displayed in the form of a sliding side navigation bar that when viewed on a mobile device, a side panel will just slide out from left to right and display our navigation links.



<ul class="side-nav" id="mobile-demo">
            <li><a href="sass.html">Sass</a></li>
            <li><a href="badges.html">Components</a></li>
            <li><a href="collapsible.html">JavaScript</a></li>
          </ul>

Let's do a refresh.
We need an additional icon, which is the three line burger-bar menu icon that we need to put in place.
Then we need to make that clickable.
So let's grab the icon first.


<a href="#" data-activates="mobile-demo" class="button-collapse"><i class="material-icons">menu</i></a>


It's a link, it's embedded inside the link, to make it clickable.
Let's do a refresh.
It appears when viewed on a mobile device.
So we then need to create an event handler for it, or add an event handler for it.

$(document).ready(function(){
    $('.button-collapse').sideNav();
  });

So the class is called button collapse for that link we just added.
We need to add this into our document.ready() function.
So let's grab that.
Go to our base.html.
We see the ready function for our document is in place.
Pop that in.
Do a refresh, and we can see our links are there. Now, these are the default links.
You see page not found when we click on them.
So what we need to do there now is to add our actual links to the nav bar.
So we'll replace the default <href> for sass badges and they'll be collapsible.
Just as we've been doing throughout, we'll use the jinja templating language format.
So we'll use url_for.
Our first one will be get_tasks.
We'll call that home.
Again, it's good UX to always call your homepage home.
In our case, what do we want to display when a user first arrives on the application?
Well, it's the list of tasks.
It gives them the ability to add a new task.
We'll give our users the ability to manage categories.
Let's have an uppercase C there for categories.
Save our changes.
Just do a quick check there.
So we also need to add these links into our sidebar when viewed on a mobile device.
Let's change our task manager.
The logo should always bring you to the home page.
Again, it's good UX.
So if you click on your logo, wherever you are on your application, it should always take you home.
So there we can see it.
All of our functionality is there.
You can add tasks, insert tasks, and we can get tasks.
Let's do a refresh.
Look at home.
Check new task.
It's all there.
Let's test it by adding a new task.
So it looks good. It's looking pretty decent.
We can add categories and edit categories.
We're in good shape.
Here's our sidebar.
So it looks good on mobile, and it looks good on desktop.
If you are so inclined, you can style it further and personalize it for your needs, but well done on getting this far!
