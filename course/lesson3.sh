 Deploy The Application To Heroku


 Now let's head over to Heroku and create a corresponding app that we will use to deploy our Cloud9 application.
Let's create an an app name. Remember, the app names must be unique.
And in my case, I'm choosing Europe as the edge server so that the delivery will be that bit quicker.
Our app is in place.
Next thing we do is we're going to log on.
And these are the sets of commands that are provided to help you on the way.
So let's log in to Heroku.

Again, enter your credentials.
Your email followed by your password.
What we are doing here is we're creating a connection between our Cloud9 application and Heroku that would allow us to push our changes using Git to update the application at any given time.
Check the apps.
You can see task-manager-flask-mongo is there.
Then, we create a new Git repository using git init.
And then what I'm going to do is add our files to the repository.
And then we're going to associate the Heroku application as our master branch, or remote master branch.
And here is a command that will allow us to do that back over in Heroku.
You can see Heroko's interface is quite useful and informative in helping you get set up.
It's set.
And then we want to push to Heroku.
It's failed because we don't have our requirements text file in place.
The requirements text will contain a list of the applications that are required for Heroku to run the application.
So in order to do that, we will create a requirements.txt file.
So our command is sudo pip3 freeze --local > requirements.txt.
The > means add the requirements to a file called requirements.txt.
That's done.
Then we add our requirements file to Git.
Why? Well, to save it to a repository, but also to push it over to Heroku.
Don't forget your commit message.
Always have a meaningful commit message.
We're going to push to Heroku master.
We have "Warning: Your application is missing a Procfile".
You can see that message appears there as part of the push message.
And the Procfile is an instruction to Heroku as to which file is used as our entry point at the application, which file we use to call the application to get it up and running.
So we'll specify that now using echo web Python.
We're specifying that it's a Python file.
And the name of it is app.py, which matches the name of the Python file that we manually created.
And we'll send that information into a file called Procfile.
Remember, there's no extension on Procfile.
Then we'll add the Procfile to GitHub.
Again, add a new message that reflects as accurately as you can the reason for that commit.
Pushing to master.
Now you can see that the Python app was detected.
It's pushing the contents over.
That looks like a healthy push.
And the next thing we want to do is we want to run our application.
So this is a command over to the Heroku app to tell it to get up and running.
You can see scaling dynos done.
You see our interface here. We're going to go to settings.
And we need to specify our IP and our port.
You remember we set those in the last video.
We need to set those on Heroku so that the server instance on Heroku will know how to run our Flask application.
So our IP address is 0.0.0.0
And our port is 5000.
Open the app.
And there we go.
We're good to go.
Successfully deployed.