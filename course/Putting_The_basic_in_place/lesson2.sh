
 Create The Flask Application

I've just created a new empty project in github
Go and do that now, and pause the video before moving on.
Once you have that done, the first thing we're going to do is install Flask.

So we use sudo pip install flask.

And that sets us up with our Flask functionality ready to be imported.
The second thing we need to do is, because this is a blank application, we need to create a new Python file.

And in this case, we'll call it app.py.

The first thing we need to do is we need to import our Flask functionality in order to set up the application for use.
And then we create an instance of Flask, or a Flask app.

And we store it in the app variable here on line 3. 
We do app = Flask(__name__)
And then we'll test.
We'll create a test function with a route in it that will display some text as a proof of concept.
Remember the '/' refers to the default route.
So in the spirit of tradition, we're calling this hello.
So we'll return a meta Hello World message, a variant on the Hello World message.
You've done this already before in Practical Python.
So let's call it Hello World again.

create app.py with this entries:

import os
from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello():
    return 'Hello World....again'

if __name__=='__main__':
    app.run(host=os.environ.get('IP'),
            port=int(os.environ.get('PORT')),
            debug=True)

    
And once this is in place, we will then set up our IP address and our port number so that Cloud9 knows how to run and where to run our application.
In the next video, we'll deploy to Heroku, and we will assign the same values of IP address and port number.
In order to do this, we need the OS.
Now, inside our app.run() function, we set the host.

if __name__ == '__main__':
    app.run(host=os.environ.get('IP'),
            port=int(os.environ.get('PORT')),
            debug=True)

Again, we use the OS import here, we use the environ object, and then we get the IP.
Don't forget your comma.
And then we set the port.
And we convert the port to an integer.
Again, we'll use os.environ.
And we'll get the port.
Again, don't forget your comma because the last parameter we want to pass in is my debug.
We want to set that to true.
By setting it to true, it allows the changes to be picked up automatically in the browser.
And it'll also produce debug statements in the case of a bug.
So let's run it.
Now you can see that it's running on http://0.0.0.0:8080.
And we'll change those for Heroku later on.
And there we have it, a working Flask application.
