#Auth0 + Ruby on Rails WebApp Seed
This is the seed project you need to use if you're going to create a regular WebApp with Ruby on Rails. If you want to build a Ruby On Rails API that will be used with a SPA or a Mobile device, please check this [other seed project](https://github.com/auth0/ruby-auth0/tree/master/examples/ruby-on-rails-api)

This example is deployed at Heroku at http://auth0-ror-webapp-sample.herokuapp.com/

#Running the example
In order to run the example you need to have ruby installed.

You also need to set the ClientSecret and ClientId for your Auth0 app as enviroment variables with the following names respectively: AUTH0_CLIENT_SECRET, AUTH0_CLIENT_ID, AUTH0_DOMAIN and AUTH0_CALLBACK_URL.

For that, if you just create a file named .env in the directory and set the values like the following, the app will just work:

````bash
# .env file
AUTH0_CLIENT_SECRET=myCoolSecret
AUTH0_CLIENT_ID=myCoolClientId
AUTH0_DOMAIN=samples.auth0.com
AUTH0_CALLBACK_URL=localhost:3000
````
Once you've set those 4 enviroment variables, just run `rails s` and try calling [http://localhost:3000/](http://localhost:3000/)
