# Bubble Buddies
## A two-sided marketplace for recretional SCUBA divers to find and meetup with dive buddies, and for instructors to sell their services to fellow buddies

### Demo Heroku Deployment

https://bubble-buddies.herokuapp.com

### Problem and Solution Solved

Excellent meetup platforms exist such as [meetup.com](https://www.meetup.com/) for people to get together in thriving communities. Whilst it's certainly feasible to host SCUBA diving meetups on such platforms, the interface and functionalities are not tailored specifically for recreational divers and dive instructors to be able to find and get together for the most compatible and tailored SCUBA diving experience.

For most qualified, recreational SCUBA divers it is mandatory around the world that divers must always dive in buddy pairs. Unless you're a regular member of a dive club, it can be difficult for individuals to find a buddy to dive with that would be compatible to your diving experience level, and to your location and available day/time. This is the key problem that is intended to be solved with Bubble Buddies.

When a user (refered to in this app as a "buddy) signs up for the first time, they must also specify whether they're a regular diver (not instructor), or a dive instructor, before they can create or join a meetup. As part of this sign up and registration process, they must also specify what their experience is, and in the case of an instructor, what courses (include dive agency) they're able to teach. This filtering and tailorisation, again, allows and ensures that buddies have the best dive experience possible, without the hassle of any loose, unspecialised meetup planning logistics.

Dive instructors looking to teach a course or specialisation to a group of buddies and receive payment for their services aren't left out from this web app either. If a buddy creates a meetup as a dive instructor, they can specify how much they want to charge for the meetup to teach a course, and other buddies looking to join must make a payment before they're able to join (hence what makes this a two-sided marketplace). 

To summarise, Bubble Buddies, once ready for production deployment, will provide a specialised, tailored meetup platform with the following key features:

* Recreational divers (not at an instructor) can find and meetup with other buddies for a dive, as well as join a meetup by an instructor looking to teach a course or specialisation.
* Dive instructors can sell their services by creating a meetup to teach a course or specialisation, and to accept payment for it.
* Reduced logistics in meetup planning with tailored forms and other interfaces to show and share all the most important information to a dive meetup.

#### Ethical Considerations 

* Many buddies may use this platform to meet other buddies who they've never met before. This could potentially be dangerous.
* Users could potentially exploit the system to stalk or harass others.
* There is no filtering on the user profile picture upload and storage, so offensive images could be uploaded and displayed on the platform.

### Technical Summary

Built on:

* Rails v5.2.0 and Ruby v2.3.3

* SASS and HTML ERB

##### Key GEMs Used

* Figaro - for environment var protection (i.e. .gitignore use)
* Devise - for user authentication
* Rolify - to assist in user authorisation mapping
* Carrierwave and Cloudinary - for user profile picture image upload and cloud storage
* Recaptcha - for bot prevention
* Geocoder and gmaps4rails - for Google Map API integration and display
* Stripe - for payment acceptance and processing 

### Setup for Local Deployment

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

### ERD Link

[ERD Link](https://drive.google.com/file/d/1fOhDAAZVQjMLSxM36yNxYSdg6AMeWfSh/view?usp=sharing) - https://drive.google.com/file/d/1fOhDAAZVQjMLSxM36yNxYSdg6AMeWfSh/view?usp=sharing

[Screenshot](https://i.imgur.com/pjug9zn.jpg)

### Release History

11/05/2018 - Version 0.1 - Prototype app deployed and live to heroku using production env

### Developer and Designer

Chris Hullman - https://github.com/chullman
