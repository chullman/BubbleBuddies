# Bubble Buddies
## A two-sided marketplace for recretional SCUBA divers to find and meetup with dive buddies, and for instructors to sell their servers to fellow buddies


### Setup for local deployment

1) Install and run a local copy of a Postgresql server

2) Change port in config/database.yml to your Postgresql server port, and host to wherever your Postgresql server is running

3) Clone the repo and run a `bundle install`

4) Create accounts to get API keys for the various dependencies
  a. Create a Cloudinary account - https://cloudinary.com/ and note the public and private keys
  b. Create reCAPTCHA keys, registered under localhost or whatever domain you're running your Rails server on - https://www.google.com/recaptcha/admin

4) Run `bundle exec figaro install` so API keys can be passed in as env vars

5) In config/application.yml, create and populate the following vars with the relevant keys, as well as your Postgres user password:
  ```
  postgres_password: ""

  cloudinary_api_key: ""
  cloudinary_api_secret: ""

  recaptcha_site_key_dev: "
  recpatcha_secret_key_dev: ""

  recaptcha_site_key_prod: ""
  recaptcha_secret_key_prod: ""
  ```

6) Create and migrate the database:
  a. `rails db:create`
  b. `rails db:migrate`
  c. OPTIONAL: `rails db:seed` (NOTE: Windows users may need to uninstall bcrypt-3.1.11-x86-mingw32)
