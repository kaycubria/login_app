# A Little LoginApp

A simple Ruby on Rails authentication application.

The application allows three types of users - admin, user, and restricted - to login. Once authenticated through email and password, users can see and do different things depending on their level of permissions.

Restricted Users can:
Login
See a list of users

User Users can do all of the above plus:
See each users profile
Edit their own profile, except their role

Admin Users can do all of the above plus:
Edit other users profile
Edit users roles
Delete users

New users are User Users by default at creation.

## Tech Specs

This application was built with:

* Ruby 2.3.0
* Rails 5.0.1
* SQLite3 3.13.0
* Rspec 3.5.4

See the [Rails Getting Started Guide](http://guides.rubyonrails.org/getting_started.html) for links to the necessary dependencies to run Rails on your machine.

## Running the App

From your terminal, do the following:

##### Clone this git repo

```
git clone https://github.com/kaycubria/login_app.git
```

##### Cd into the LoginApp library

```
cd loginApp
```

##### Bundle intall the Ruby Gems

```
bundle install
```

##### Create and migrate the database

```
rake db:create db:migrate
```

##### OPTIONAL: Seed the database with test users

```
rake db:seed
```

This will automtically create three users.

Emails:
* admin_user at appusers dot com
* user_user at appusers dot com
* restricted_user at appuser dot com

All with the password: password111

You'll want to create your own unique admin users with it's own password if you plan to do anything more than play with this app. The easiest way to do this is create a user from the UI, login as the admin user and upgradde your user's status to admin. Then delete all the seeded users.

##### Run the application

```
rails server
```

##### Play with the app

With the server running, navigate in your favorite browser to http://localhost:3000 (or to whatever address your terminal directs you).

##### Run the test suite

```
bundle exec rspec
```

##### OPTIONAL: Drop the database (if you want to start over)

```
rake db:drop
```