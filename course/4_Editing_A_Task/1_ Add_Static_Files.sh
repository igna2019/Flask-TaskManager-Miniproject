Add Static Files

1-What is it?

A directory called 'static'

2-What does it do?

A directory that holds static files i.e. files that don't change that often such as CSS files, custom JavaScript, images and so on

3-How do you use it?

You include a route to your static folder and file in your 'base.html' file like so:

<link rel="stylesheet" href="{{url_for('static', filename='css/style.css')}}" type="text/css"/>



Description

Now in addition to importing third-party libraries, JavaScript and CSS libraries, we're going to apply our own custom styles to our buttons.
So in order to do that, we set up a static directory, as is required with Flask, and Django as well by the way.
Again, it follows the same rules as the templates directory.
It must be spelled with a lowercase s.
And inside there, that's where we store what are called our static assets, assets that don't change that often, such as CSS files, custom JavaScript, images, and so on.
So inside there, we create a CSS directory, and a file called style.css.
A little trick that I like to use when checking whether a style is being targeted correctly is to use something, a garish background color for example.
And in this case, we're going to set the background to red.
And if it works, you'll know about it straightaway.
There's no subtlety in having a red background color.

body {
    background-color: red;
}

We refer to our stylesheet.
And in our url_for, we refer to the static directory.
And the file itself will be css/style.css.

<link rel="stylesheet" href="{{url_for('static', filename='css/style.css')}}" type="text/css">

Save that.
Just make sure that's in place.
Refresh.
There we go, a red background.
We're going to comment that out.
Let's do a refresh.
You see here in this example, it didn't refresh.
Ykou can clear your browsing data, or you can run your code in an incognito view of the browser, and that doesn't cache your styles.
And there we go.
We're ready to go. We're ready to style our custom buttons.