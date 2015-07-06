hello-cf
========

This simple application displays the request URL, the port number an some application meta-data for the deployed application instance.  Displaying the port number supports a demonstration where, when deployed to Cloud Foundry and the application crashes, a instance will be created and the app will be redeployed and started.

The script for the demo is as follows:

# Clone this repo
# Deploy the app
Deploy your app instances using `cf push`. Subsititute `<your-unique-app-id>` with a unique name (e.g. your group id of the course). The name (-n) of your application has to be unique within the same dns `<domain>` of the plattform (`cfapps.io` in case of PWS).
`hello-cf` is your (internal) name for the app, which has to be provided for each cf-command.
```
cf push hello-cf -m 128M -n hello-cf-<your-unique-app-id> 
```
This will deploy the application to `http://hello-cf-<your-unique-app-id>.<domain>` where `<domain` is the default domain of the plattform (in case of PWS this is `cfapps.io`).
# Start tailing the logs
Recommend splitting your terminal and in one half start logging with:
```
cf logs hello-cf
```
# Access the app in your browser
Check out the environment information which is provided about the application.
```
http://hello-cf-<your-unique-app-id>.<domain>/broken
```
where `<your-unique-app-id>` is the name you've chosen above and `<domain>` is the DNS domain you deployed your app to (in case of PWS this is usually `cfapps.io`).
# Scale your application
Scale your application to 3 instances - this will allow you to show that in the short time one instance is crashed, the others are still serving traffic.
```
cf scale hello-cf -i 3
```
# Access the app in your browser once more
Hit refresh a few times and point out the two different port numbers displayed. Have audience remember the two port numbers
# Kill one of the app instances
You can do this by accessing the url
```
http://hello-cf-<your-unique-app-id>.<domain>/broken
```

# Look at log and app instances
You'll have to be quick - do a 
```
cf app hello-cf
```
showing that one of the app instances is down.
Highlight stack trace in the logs and then run this again showing the app is restarted:
```
cf app hello-cf
```
# Refresh app in browser
Refresh until you show that one of the port numbers remains the same but one has been replaced with a new port number.

Reminder!!! Make sure you go back to the URL without the "/broken" suffix or you'll crash your app again.