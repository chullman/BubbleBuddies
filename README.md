# Bubble Buddies
## A two-sided marketplace for recretional SCUBA divers to find and meetup with dive buddies, and for instructors to sell their services to fellow buddies

### Demo Heroku Deployment

https://bubble-buddies.herokuapp.com

### Setup for local deployment

Assuming you have a Rails environment up and running:

1) Install and run a local copy of a Postgresql server

2) Change port in config/database.yml to your Postgresql server port, and host to wherever your Postgresql server is running

3) Clone the repo and run a `bundle install`

4) Create accounts to get API keys for the various dependencies

    a. Create a Cloudinary account - https://cloudinary.com/ and note the public and private keys
  
    b. Create and note reCAPTCHA keys, registered under localhost or whatever domain you're running your Rails server on - https://www.google.com/recaptcha/admin
  
    c. Get a API key for Google Maps

    d. Create a Stripe account and grab API keys for it
    
    e. If deploying into a development environment, create a Gmail account and set it to allow "less secure apps" - https://myaccount.google.com/lesssecureapps

5) Run `bundle exec figaro install` so API keys can be passed in as env vars

6) In config/application.yml, create and populate the following vars with the relevant keys, usernames and passwords from Step 4, including your Postgres user password:
  ```
  postgres_password: ""

  cloudinary_api_key: ""
  cloudinary_api_secret: ""

  recaptcha_site_key_dev: "
  recpatcha_secret_key_dev: ""

  recaptcha_site_key_prod: ""
  recaptcha_secret_key_prod: ""
  
  google_api_key: ""

  stripe_public_key: ""
  stripe_private_key: ""
  
  gmail_username: ""
  gmail_password: ""
  ```

7) Create and migrate the database:

    a. `rails db:create`
  
    b. `rails db:migrate`
  
    c. OPTIONAL: `rails db:seed` (NOTE: Windows users may need to uninstall bcrypt-3.1.11-x86-mingw32)

### Sample Data

If you ran `rails db:seed` above, this will include a couple of test users:

a. Admin user - email: admin@admin.com, password: admin
b. Normal user - email: test@test.com, password: test
