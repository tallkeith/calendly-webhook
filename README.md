# README

## TL:DR
- Save the disposable API key locally (see below)
- Clone this repo
- `cd` into the directory you just cloned
- `bundle install`
- `rake db:create`
- `rake db:migrate`
- `rails s` in one terminal (using port 3000 by default)
- `ultrahook github http://localhost:3000/webhooks` in another terminal tab/window
- Open a browser tab and navigate to http://localhost:3000/
- [Schedule a meeting](https://calendly.com/tallkeith/)
- Schedule and/or cancel meetings with me at will from your own calendar
- Refresh your browser window to view the new information
- Schedlue meetings on different days to view more than one bar on the graph

## Introduction

Hello! Thank you for checking out this project. This is a simple app that serves as an exercise in consuming Calendly's Webhooks.

This project follows conventional Ruby on Rails project layouts. To find the bulk of the code added, you can find it in `app/controllers/webhooks_controller.rb`. Changes were made to the view which can be found in `app/views/webhooks/index.html.erb`.

At it's core, this project is a simple dashboard app that displays a graph as well as detailed meeting information. The information displayed via the graph reflects meetings scheduled and canceled.

## How to make it go (detailed)

Detailed step by step instructions on how to get this app up and running locally.

### Ultrahook account info

You will need a way to receive incoming webhooks. There is a nifty little gem that helps with receiving webhooks in a dev environment. [Check out ultrahook](http://www.ultrahook.com). If you send a request to keithpnash@gmail.com, I will send you instructions for how to save the API key locally and get ultrahook to work locally. This is not an automated response (yet), so be patient if it takes a bit to get a response.

Calendly requires a user to subscribe to a webhook and a specific URL to which to send the aforementioned hook. In the future, I will most likely build out a feature that allows a user to subscribe to a specific webhook with their own Calendly API key and their own ultrahook account info, but for now, just email me.

### Clone this Repository

You will want to [Clone this repository](https://help.github.com/articles/cloning-a-repository/). In short, you will be copying the files for this project found on Github to your local machine, allowing you to make changes to this project on your machine.

### CD into the Created Directory

Once you have this repository cloned to your local desktop, in your terminal, change the current working directory to the newly created folder.

### Bundle Install

Once you are inside of the correct working directory, run `bundle install` from your terminal. This will install the necessary gems to run this web app.

### Create a local database

Run `rake db:create` in your terminal. This will make a new database for storing the info received from incoming webhooks.

### Run migrations

Now that we have a database, we need to add some columns to it. Run `rake db:migrate`. I chose not to include any seed data with this project, as it is intended to show how data is received and processed, as opposed to just showing the data itself.

### Run Rails Server

Now that your environment is set up, you are ready to run `rails server` in your terminal. This will start the rails server.

### Get ultrahook running locally

Now that we have the server up and running, we need to get ultrahook running locally. Open another terminal window/tab and run `ultrahook github http://localhost:3000/webhooks`. You should see something like

```
Authenticated as tallkeith
Forwarding activated...
http://github.tallkeith.ultrahook.com -> http://localhost:3000/webhooks
```

Not seeing something like that? Did you email me and ask for the ultrahook credentials?

### Look at what you got

Once the server is running (from when we ran `rails s` in the terminal), open up your favorite internet browser (I used Chrome for developing this app) and navigate to `localhost:3000`. Once that page loads, you should see a graph and some meeting information. If there is no meeting information, and the graph is blank, that means that there have not been any webhooks received yet. Schedule a meeting with me to populate new information on the graph.

### Schedule a meeting

Now that the rails server is up and running and the ultrahook tunnel has been established, it's time to [schedule a meeting](https://calendly.com/tallkeith/) with me. [Click here to schedule a meeting](https://calendly.com/tallkeith/).

Once you have scheduled a meeting, go back to your browser and refresh the page. Your new meeting should show up on the graph. In your terminal running ultrahook, you should see something like `[2019-04-07 17:06:05] POST http://localhost:3000/webhooks - 204`, which means that the request was successful. Scheduling a meeting will create a blue bar on the graoh.

If you like, you can also cancel the meeting from your own calendar. The meeting invitation should have a link to cancel the meeting. Click that link and complete the form saying why you are cancelling. Go back to `localhost:3000` and refresh the page. There should now be a bit of red added to the graph, as well as meeting information indicating the cancellation.

Schedule and/or cancel meetings on a few different days to view more than one bar on the graph.

## Troubleshooting

If you are scheduling meetings and not seeing them populate in the browser, check to be sure that ultrahook is sending back successful response codes. If no new code has shown up (successful or otherwise), try restarting the ultrahook tunnel by pressing `control + c` and restarting with the command `ultrahook github http://localhost:3000/webhooks`.

This fixes things in most cases.
