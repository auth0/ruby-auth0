#Auth0 + Ruby on Rails WebApp Seed
This is the seed project you need to use if you're going to create a regular WebApp with Ruby on Rails. If you want to build a Ruby On Rails API that will be used with a SPA or a Mobile device, please check this [other seed project]()

This example is deployed at Heroku at http://auth0-ror-webapp-sample.herokuapp.com/

#Running the example
In order to run the example you need to have ruby installed.

You also need to set the ClientSecret and ClientId for your Auth0 app as enviroment variables with the following names respectively: AUTH0_CLIENT_SECRET and AUTH0_CLIENT_ID.

For that, if you just create a file named .env in the directory and set the values like the following, the app will just work:

````bash
# .env file
AUTH0_CLIENT_SECRET=myCoolSecret
AUTH0_CLIENT_ID=myCoolClientId
````

Once you've set those 2 enviroment variables, just run node server.js and try calling [http://localhost:3000/ping](http://localhost:3000/ping)

You can then try to do a GET to [http://localhost:3000/secured/ping](http://localhost:3000/secured/ping) which will throw an error if you don't send the JWT in the header.
