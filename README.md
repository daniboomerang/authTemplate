# authTemplate for Rails 4.0.0
==============================

authTemplate is a template for Apps with Users/Admins support.

It uses Rails 4.0.0, Ruby 2.0.0, Devise 3.0.0rc, Bootstrap 3.0 and PostgreSQL

# Find authTemplate at
## http://authtemplate.herokuapp.com/

## Installation

Install bundler if you haven't yet:

```
gem install bundler
```

Install the gems:

```
bundle install
```

This will install Rails 4.0.0, PG gem and Devise.

Rake devise setup task:

```
rake devise:setup
```

This will:

* drop any existing database
* create a new database
* migrate the database
* create a default user and admin

## Handling Environment Variables

Use Figaro in order to Set the Environment Variables

The gem provides a generator:

```
rails generate figaro:install
```

The generator creates a **config/application.yml** file and modifies the *.gitignore* file to prevent the file from being checked into a git repository.

Now that we have a method to set the ENV variables we van proceed to set up the credentials for the SMPT Server (SendGrid).

Open **config/application.yml** and set your personal SendGrid credentials like this:

```
HOST: 'localhost:3000'
SENDGRID_USERNAME: "mySendgridUsername"
SENDGRID_PASSWORD: "mySendgridPassword"
```

Remember your credentials will be safe, not pushed to GitHub, since Figaro automatically included the file **application.yml** in **.gitignore**

### Mail Sender configuration.

Mail sender is using Sendgrid as SMTP server.

Credentials for Sendgrind are configured in **config/environments/development.rb** via ENV variables.

```
 ActionMailer::Base.smtp_settings = {
  :address        => 'smtp.sendgrid.net',
  :port           => '587',
  :authentication => :plain,
  :user_name      => ENV['SENDGRID_USERNAME'],
  :password       => ENV['SENDGRID_PASSWORD'],
  :enable_starttls_auto => true
  }
```

Which should be already set up if you added the ENV variables in application.yml.

Run the server and use the credentials provided by the rake task to sign in and test the application.

# authTemplate 1.0
==============================

For the next release:

* AngularJS
* Styling e-mails
* Internationalization 

## License

MIT License. Copyright 2010-2013 Daniel Estevez

