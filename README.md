### Overview
Version 0.2.1 of this application tracks query criteria for events ("event queries").  Event queries can include source (meetup, eventbrite, general), key word, date range, and time range for when you can attend.  For example, you can specify that you are looking for Python events that occur within the next month between 6 and 9 PM.

Future versions will query event sources such as meetup and eventbrite to notify you when new events occur and existing events change.

The application requires you create an account.  You will only be able to see event searches that you create.  Options to create and list your event queries are available when you log in.  To edit or delete an event query, you can click on the link to the event query from the list.

### Technologies Used
- React, React Hooks
- JavaScript
- JSX
- HTML
- CSS
- bootstrap

### Related Repositories

Here is a complete list of the Github resources involved in developing this application:

Source code:
  - Client: https://github.com/ethanstrominger/event-finder-ultimate
  - Backend: https://github.com/ethanstrominger/event-finder-rails-api

Deployment
  - Client: https://ethanstrominger.github.io/event-finder-ultimate/
  - Backend APIs: https://mysterious-dusk-65019.herokuapp.com/event_searches

Templates
If you like what you see and would like to develop something similar, you can use the following templates.  These were based on templates provided by General Assembly and then evolved. The history of the original template and changes are listed in the commit history.
- Backend APIs: https://github.com/ethanstrominger/rails-api-with-tests-template
- Client: https://github.com/ethanstrominger/react-auth-hook-template

### Planning, Problem Solving, and Unresolved Problems
See https://ethanstrominger.github.io/event-finder-ultimate/ README for details.

### Install instructions
1.  Download project from https://github.com/ethanstrominger/event-finder-rails-api-with-tests
1.  Unzip and rename directory
1.  Move into the new project and `git init`
1.  Rename your project database in `config/database.yml`
1.  Install dependencies with `bundle install`.
1.  `git add` and `git commit` your changes.
1.  Create a `.env` for sensitive settings (`touch .env`).
1.  Generate new `development` and `test` secrets (`bundle exec rails secret`).
1.  Store them in `.env` with keys `SECRET_KEY_BASE_<DEVELOPMENT|TEST>`
    respectively.
1.  In order to make requests to your deployed API, you will need to set
    `SECRET_KEY_BASE` in the environment of the production API (for example, using `heroku config:set` or the Heroku dashboard).
1.  In order to make requests from your deployed client application, you will
    need to set `CLIENT_ORIGIN` in the environment of the production API (for example, `heroku config:set CLIENT_ORIGIN=https://<github-username>.github.io`).

  See more about deploying to heroku [rails-heroku-setup-guide](https://git.generalassemb.ly/ga-wdi-boston/rails-heroku-setup-guide)

### Setup your database:
    - bin/rails db:drop (if it already exists)
    - bin/rails db:create
    - bin/rails db:migrate

  **Note**: Do this for each database you want to set up. Your local database and production (Heroku) database will both need to be set up in this way!


### Routes

Prefix Verb   URI Pattern                   Controller#Action
event_searches GET    /event_searches(.:format)     event_searches#index
       POST   /event_searches(.:format)     event_searches#create
event_search GET    /event_searches/:id(.:format) event_searches#show
       PATCH  /event_searches/:id(.:format) event_searches#update
       PUT    /event_searches/:id(.:format) event_searches#update
       DELETE /event_searches/:id(.:format) event_searches#destroy

sign_up POST   /sign-up(.:format)            users#signup
sign_in POST   /sign-in(.:format)            users#signin
sign_out DELETE /sign-out(.:format)           users#signout
change_password PATCH  /change-password(.:format)    users#changepw

Examples of how to use the routes can be seen in the tests which are located
in the spec/requests folder.

### Automated Testing <a name="Testing"></a>
All possible endpoints were tested using rspec.  Reports were generated using
simplecov.

# Entity Relationship Diagram <a name="ERD"></a>
![ERD](doc/event-finder-erd-online-visual-paradigm.png?raw=true)

## [License](LICENSE)

1.  All content is licensed under a CC­BY­NC­SA 4.0 license.
1.  All software code is licensed under GNU GPLv3. For commercial use or
    alternative licensing, please contact legal@ga.co.
