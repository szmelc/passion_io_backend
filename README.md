# Passion.io Recruitment Task API

### Description

This is the API for Passion.io recruitment task. This app offers a simple functionality of interacting between 3 models: `Vertical`, `Category` and `Course`. Authenticated user can add categories and courses. User can also delete categories and his/her own courses. After a course is created, an email notification is sent to all users. NOTE: This does not work in remote environment - in order for this to work, external mail provider like Mailchimp or Mailjet would need to be added.

The app uses `grape` for API, `devise` and `doorkeeper` for authentication, `pundit` for authorization and `kaminari-grape` for pagination.

Some noteworthy mentions:

  * the app uses Result object pattern for all services - they always return `Success` or `Failure` object
  * all possible errors (as of now) are unified according to this pattern and are handled by `API::ErrorHandlers`:

  ```
  {
    "errors": [
      "Error message 1",
      "Error message 2"
    ]
  }
  ```
  * API uses versioning
  * Rubocop conventions are obeyed

#### Possible improvements

* caching results
* adding pagination-related specs
* adding security headers to API responses
* hooking mailing system with external email provider
* adding refresh token
* adding sidekiq for processing email notifications

### Technology stack

* Ruby 2.6.3
* Rails 6.0.0
* PostgreSQL 9.6

## Prerequisites

You will need the following things properly installed on your computer:

For rails app:
 * ruby (via rvm, use proper Ruby version) - https://rvm.io/ `rvm install ruby-2.6.3` `rvm use 2.6.3 --default`
 * postgres https://postgresapp.com/ or `brew install postgresql`

## Installation

Running `bin/setup` will create a database, install necessary dependencies, set up doorkeeper application and populate the database with seed data.

## Running / Development

`rails s`

## API (backend)

API is built with [grape](https://github.com/intridea/grape) gem and authentication is handled with [doorkeeper](https://github.com/doorkeeper-gem/doorkeeper) gem by [Resource Owner Password Credentials Grant](https://oauthlib.readthedocs.io/en/latest/oauth2/grants/password.html).

API documentation is generated with [grape-swagger](https://github.com/tim-vandecasteele/grape-swagger) gem and is available under `/docs`

In order to use API endpoints, resource owner authentication token is required. You can obtain the token by:

```bash
  curl -F grant_type=password \
  -F email=YOUR@EMAIL.COM \
  -F password=YOUR_PASSWORD \
  -X POST http://localhost:3000/oauth/token
```

The response will contain both `access_token` and `refresh_token`.

**NOTE**: Please replace host with an address relevant for [the environment](#api-backend).

To authenticate API calls to any endpoint that is protected with access token, pass `Authorization` header into the request as follows:

`-H 'Authorization: Bearer ACCESS_TOKEN'`

### Sample User

After running seed data, a test user will be present in the database. Authentication can be performed with following credentials:

```bash
login: test@test.com
password: 123123
```

## Running Tests

`rspec` - start all tests


## Remote Environment

API is hosted on Heroku and is available at [evening-stream-34331.herokuapp.com](https://evening-stream-34331.herokuapp.com/). To access API documentation, please go to [API docs](https://evening-stream-34331.herokuapp.com/docs).

#### URLs

|      environment      |                                               url                                              |
|:---------------------:|:----------------------------------------------------------------------------------------------:|
|       production         |       [evening-stream-34331.herokuapp.com](https://evening-stream-34331.herokuapp.com)       |
