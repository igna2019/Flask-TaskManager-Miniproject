<img src="https://codeinstitute.s3.amazonaws.com/fullstack/ci_logo_small.png" style="margin: 0;">

Welcome igna2019,

This task manager will be built using Flask, MongoDB, and a frontend framework called Materialize. 
	.	So what will we learn by building this application? 
	.	Well, we'll learn how to do create, read, update, and delete calls, otherwise known as CRUD calls, to a Mongo database. 
	.	And we'll do that in the context of a Flask application. 
	.	We will also create HTML based user interfaces to demonstrate these CRUD calls in action. 
	.	And in the spirit of good user experience, we'll style these interfaces using the Materialize framework. 
	.	Now let's look at the project we're going to build. 
	.	So the home page of our task manager application displays a summary of tasks. 
	.	And that summary information is comprised of the task name, the task due date, and a task description. 
	.	We can also edit a task, mark a task as complete, or add a new task on the home page. 
	.	The information required to create a new task is a task category; a task name; a task description; a task due date, in this case, provided by a calendar where we can specify months, years, and the day; and, finally, the last piece of information is determining whether it's urgent or not. 
	.	You can see here, there's our new task added. 
	.	You can also edit an existing task. 
	.	You might want to change the date or any of the other properties of this task. 
	.	Once you update, again, you're brought back to the home page. 
	.	And you can see the date has changed. 
	.	Now, a task is assigned a category. 
	.	And the application will provide you with the ability to edit, delete, and create new categories. 
	.	So for example, you might change arts to music. 
	.	You can see there that it's updated. 
	.	And when we go to create a new task, you can see that that new task category is available. 
	.	We can create a new category. 
	.	Notice that all our interfaces use the same visual theme. 
	.	We're consistent in our use of the Materialize framework. 
	.	Our application is responsive, which means it will respond appropriately to the device on which it's being displayed. 


## Gitpod Reminders

To run a frontend (HTML, CSS, Javascript only) application in Gitpod, in the terminal, type:

`python3 -m http.server`

A blue button should appear to click: *Make Public*,

Another blue button should appear to click: *Open Browser*.

To run a backend Python file, type `python3 app.py`, if your Python file is named `app.py` of course.

A blue button should appear to click: *Make Public*,

Another blue button should appear to click: *Open Browser*.

In Gitpod you have superuser security privileges by default. Therefore you do not need to use the `sudo` (superuser do) command in the bash terminal in any of the backend lessons.

## Updates Since The Instructional Video

We continually tweak and adjust this template to help give you the best experience. Here are the updates since the original video was made:

**April 16 2020:** The template now automatically installs MySQL instead of relying on the Gitpod MySQL image. The message about a Python linter not being installed has been dealt with, and the set-up files are now hidden in the Gitpod file explorer.

**April 13 2020:** Added the _Prettier_ code beautifier extension instead of the code formatter built-in to Gitpod.

**February 2020:** The initialisation files now _do not_ auto-delete. They will remain in your project. You can safely ignore them. They just make sure that your workspace is configured correctly each time you open it. It will also prevent the Gitpod configuration popup from appearing.

**December 2019:** Added Eventyret's Bootstrap 4 extension. Type `!bscdn` in a HTML file to add the Bootstrap boilerplate. Check out the <a href="https://github.com/Eventyret/vscode-bcdn" target="_blank">README.md file at the official repo</a> for more options.

--------

Happy coding!
