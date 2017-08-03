This is the API side of the Timer Billing App.

The client repo can be found at - https://github.com/mxdavis/timer-billing-client

It is an open sourced billing app made by and for developers.

If you fork or clone the repo, upon download you need to run:

pg_ctl -D /usr/local/var/postgres start
rails db:create
rails db:migrate
rails db:seed -- if you want seeded data via Faker
rails start - You will need to run rails start before starting the client side, because rails needs to run on port 3000, while yarn should run on 3001

Submit any issues or feature requests via a pull request.

This app is deployed to heroku:

https://bill-timer-client.herokuapp.com/

I hope you find it useful.

Version 1.0 includes:

- Adding projects
- Adding clients
- Adding tasks
- Deleting unbilled tasks
- Editing unbilled tasks
- Viewing all tasks

Coming soon: 

Login via Github
Timer for Tasks
Mark tasks as billed and download as bill