# Auth0 + Ruby API Seed

This is the seed project you need to use if you're going to create a Ruby API. You'll mostly use this API either for a SPA or a Mobile app.

# Running the example

In order to run the example you need to have ruby installed.

You also need to set the ClientSecret and ClientId for your Auth0 app as enviroment variables with the following names respectively: AUTH0_CLIENT_SECRET and AUTH0_CLIENT_ID.

For that, if you just create a file named .env in the directory and set the values like the following, the app will just work:

````bash
# .env file
AUTH0_CLIENT_SECRET=myCoolSecret
AUTH0_CLIENT_ID=myCoolClientId
````

Once you've set those 2 enviroment variables, run `bundle install`, then run `rackup -p 3001` and try calling [http://localhost:3001/ping](http://localhost:3001/ping)

You can then try to do a GET to [http://localhost:3001/secured/ping](http://localhost:3001/secured/ping) which will throw an error if you don't send the JWT in the header.

__Note:__ if you need to enable cross-origin resource sharing, check out the [sinatra-cors_origin](
https://github.com/britg/sinatra-cross_origin) gem.
