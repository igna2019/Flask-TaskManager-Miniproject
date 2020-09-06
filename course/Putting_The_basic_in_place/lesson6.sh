Materialize Setup

1-What is it?
Materialize front-end framework

2-What does it do?


A modern front-end framework (similar to Bootstrap) that helps you build a stylish and responsive application
3-How do you use it?

You reference the relevant Materialize CDNs in your parent template (i.e. base.html)


Important! You will use Materialize version 0.100.2 for these lessons.
Copy and paste the CSS link below into your projects when you need to get set up with Materialize.
<link rel="stylesheet"  href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/css/materialize.min.css">
Please do not install version 1 at this time as it will only cause confusion, break your code, and make you sad.


Links From The Video
Materialize Docs

Materialize CDN for compiled and minified CSS:

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/css/materialize.min.css">

Materialize CDN for compiled and minified JS:

<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/js/materialize.min.js"></script>



Description

We now live in a time where people have a visual expectation when interacting with apps.
Not only should something function, it should be beautiful wherever possible, or at least it should be intuitive and effective.
Now intuitive also means first-time learning.
So in order to provide that or promote that form of ease-of-use and intuition, we're going to use a library called Materialize.
Materialize is based on the material design philosophy developed in 2014 by Google.
It was originally based around the card motif, but material design now makes more liberal use of grid-based layouts, responsive animations, transitions, padding, and depth effects, such as lighting and shadows.
Materialize.CSS does a great job of providing you with pre-built functionality that does just that.
So it's a small-ish, very useful library that we're going to use to style our access, our create, read, update, and delete mechanisms, and database access functionality.
Throughout this, we'll also be cutting and pasting, or copying and pasting, chunks of pre-written HTML to help us on our way because the focus really is on accessing MongoDB.
But at the same time, it's always better to present your functionality to a user in the most intuitive way possible that promotes a positive user experience on behalf of the user.
You can see here the text being used, forms, and so on.
The interactions are visually very appealing.
It also makes use of the material icons provided by Google, but you can use other icon sets, such as Font Awesome, if you wish.
We'll be using this nav bar later on in a couple of units time towards the end of the project.
Here's an example of drop downs, the options.
Materialize does depend on jQuery as of this particular iteration, but there is a new version coming out that doesn't depend on jQuery.
And jQuery allows the communication with the document object model, the DOM, which you'll have explored in more depth on the frontend modules of the program.
You can also access the links for these via a Content Delivery Network, CDN.
And we'll place those in our parent template.
Why?
Because by placing these links in the parent template, they can be accessed within the child templates and the functionality within the child elements themselves.

As we just mentioned, Materialize is dependent on jQuery, so we need to grab a jQuery link as well to link to a jQuery Content Delivery Network.
Now, you place the jQuery before the Materialize in the head because jQuery needs to be active before Materialize uses that functionality.
Here are the Materialize icons.
The icon set isn't quite as rich as, say, Font Awesome yet, but it's quite useful for our purposes.
So then we need to take the jQuery and place it at the bottom.
Again, it's just a good practice to put your jQuery at the bottom of the <body> element because that way you can ensure that the HTML elements have been fully rendered before any JavaScript activity or functions target those elements that have been rendered.
We also use a Materialize JavaScript import as well.

<head>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/css/materialize.min.css">
</head>

<body>
    {% block content %} 
    {% endblock %}

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/js/materialize.min.js"></script>
</body>


And we're good to go!
We're good to start styling.