#Auth0 + Ruby on Rails API Seed

This is the seed project you need to use if you're going to create a Ruby on Rails API. You'll mostly use this API either for a SPA or a Mobile app. If you just want to create a Regular Ruby on Rails WebApp, please check this [other seed project](https://github.com/auth0/omniauth-auth0)

#Running the example

In order to run the example you need to have ruby installed.

You also need to set the ClientSecret and ClientId for your Auth0 app as enviroment variables with the following names respectively: AUTH0_CLIENT_SECRET and AUTH0_CLIENT_ID.

For that, if you just create a file named .env in the directory and set the values like the following, the app will just work:

````bash
# .env file
AUTH0_CLIENT_SECRET=myCoolSecret
AUTH0_CLIENT_ID=myCoolClientId
````

Once you've set those 2 enviroment variables, run `bundle install`, then run `rails s` and try calling [http://localhost:3000/ping](http://localhost:3000/ping)

You can then try to do a GET to [http://localhost:3000/secured/ping](http://localhost:3000/secured/ping) which will throw an error if you don't send the JWT in the header.

__Note:__ if you need to enable cross-origin resource sharing, check out the [rack-cors](https://github.com/cyu/rack-cors) gem.

__Note:__ if you are using Windows, add the `tzinfo-data` gem to the gemfile.
