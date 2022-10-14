
# Bubble Buddies

### By Chris Hullman

#### (Update: 14/10/2022):

This app has been redeveloped for compatibility onto a newer version of the original tech stack, with multiple various third-party dependencies and API consumption modifications.

The [_2018-original_](https://github.com/chullman/BubbleBuddies/tree/2018-original) branch on this repo contains the original project submission.

### About Bubble Buddies

A two-sided marketplace for recretional SCUBA divers to find and meetup with dive buddies, and for instructors to sell their services to fellow buddies

### Deployed Live Demo

**Link: [https://bubblebuddies.chullman.com](https://bubblebuddies.chullman.com/)**

This deployment link initially includes a couple of example users that you can log in with if you wish (unless someone has already modified their details):

* Admin user - email: admin@admin.com, password: admin

* Normal user - email: test@test.com, password: test

Otherwise, feel free to sign-up and sign-in and create or join meetups with any valid dummy data.

### Problem and Solution Solved

Excellent meetup platforms exist such as [meetup.com](https://www.meetup.com/) for people to get together in thriving communities. Whilst it's certainly feasible to host SCUBA diving meetups on such platforms, the interface and functionalities are not tailored specifically for recreational divers and dive instructors to be able to find and get together for the most compatible and tailored SCUBA diving experience.

For most qualified, recreational SCUBA divers it is mandatory around the world that divers must always dive in buddy pairs. Unless you're a regular member of a dive club, it can be difficult for individuals to find a buddy to dive with that would be compatible to your diving experience level, and to your location and available day/time. This is the key problem that is intended to be solved with Bubble Buddies.

When a user (refered to in this app as a "buddy") signs up for the first time, they must also specify whether they're a regular diver (not instructor), or a dive instructor, before they can create or join a meetup. As part of this sign up and registration process, they must also specify what their experience is, and in the case of an instructor, what courses (include dive agency) they're able to teach. This filtering and tailorisation, again, allows and ensures that buddies have the best dive experience possible, without the hassle of any loose, unspecialised meetup planning logistics.

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

* Ruby on Rails v6.7.1 with Ruby v2.7.5

* PostgreSQL v12.12

* SASS

* HTML with Embedded Ruby (ERB)

##### Key Ruby Gems Used

* Devise - for user authentication
* Rolify - to assist in user authorisation mapping
* Carrierwave and Cloudinary - for user profile picture image upload and cloud storage
* Recaptcha - for bot prevention on new user sign-up
* Geocoder and gmaps4rails - for Google Maps API integration and display
* Stripe - for payment acceptance and processing

### Setup for Local Deployment

Assuming you have a Rails environment up and running:

1) Install and run a local copy of a Postgresql server

2) Clone the repo and run a `bundle install`

3) Configure your database connection and authentication settings in config/database.yml to your local PostgreSQL instance

4) Create accounts to get API keys for the various dependencies

    a. Create a Cloudinary account - https://cloudinary.com/ and fetch the API keys for it, and note the name of your cloud
  
    b. Create and note reCAPTCHA keys, registered under localhost or whatever domain you're running your Rails server on - https://www.google.com/recaptcha/admin

    c. Source a Geocoding API (or Forward Geocoding) service and API key (I used https://www.geoapify.com/)
  
    d. Source a Google Maps JavaScript API key (https://developers.google.com/maps/documentation/javascript/overview)

    e. Create a Stripe account (https://stripe.com/) and fetch API keys for it
    
    f. If deploying into a development environment, create a Gmail account and set it to allow "less secure apps" - https://myaccount.google.com/lesssecureapps Note: The [deployed live demo](https://bubblebuddies.chullman.com/) of this Bubble Buddies app currently uses Mailjet as the email delivery service. Refer to file [email_setup.rb](https://github.com/chullman/BubbleBuddies/blob/master/config/initializers/email_setup.rb) for specifics

5) Generate your encrypted file (`/config/credentials/development.yml.enc`) to store your API keys in development: run `EDITOR="code --wait" rails credentials:edit --environment development` replacing the word `code` with your favourite editor (i'm using VS Code as you can see)

6) In the editor from above, populate the following variable names with the values from Step 4 above
  ```
  CLOUDINARY_API_KEY: ""
  CLOUDINARY_API_SECRET: ""
  CLOUDINARY_CLOUD_NAME: ""

  GEOAPIFY_API_KEY: ""
  GOOGLE_API_KEY: ""

  RECAPTCHA_SECRET_KEY: ""
  RECAPTCHA_SITE_KEY: ""

  STRIPE_PRIVATE_KEY: ""
  STRIPE_PUBLIC_KEY: ""
  
  GMAIL_USERNAME: ""
  GMAIL_PASSWORD: ""
  ```
  If needed, add in variables and their values for the PostgreSQL settings you specified in Step 2 above, if any

7) Keep the generated `/config/credentials/development.key` safe and private

8) Create and migrate the database:

    a. `rails db:create`
  
    b. `rails db:migrate`
  
    c. OPTIONAL: `rails db:seed`

### Sample Data

If you ran `rails db:seed` above, this will include a couple of test users:

a. Admin user - email: admin@admin.com, password: admin

b. Normal user - email: test@test.com, password: test

### ERD Link

[ERD Link](https://drive.google.com/file/d/1fOhDAAZVQjMLSxM36yNxYSdg6AMeWfSh/view?usp=sharing) - https://drive.google.com/file/d/1fOhDAAZVQjMLSxM36yNxYSdg6AMeWfSh/view?usp=sharing

[Screenshot](https://i.imgur.com/pjug9zn.jpg) - https://i.imgur.com/pjug9zn.jpg

### Workflow Link

[Workflow Link](https://drive.google.com/file/d/1TPMs2_Vbxc9dz3j1imZgP1X_YXm9h9QY/view?usp=sharing) - https://drive.google.com/file/d/1TPMs2_Vbxc9dz3j1imZgP1X_YXm9h9QY/view?usp=sharing

[Screenshot](https://i.imgur.com/efbjGJU.jpg) - https://i.imgur.com/efbjGJU.jpg

### User Stories for MVP

[Trello Link](https://trello.com/b/JkR55AIR/bubble-buddies-mvp) - https://trello.com/b/JkR55AIR/bubble-buddies-mvp

[Screenshot](https://i.imgur.com/pNvdIg2.jpg) - https://i.imgur.com/pNvdIg2.jpg

### Project Plan for MVP - Kanban

[Trello Link](https://trello.com/b/o9HIJphF/bubble-buddies-project-plan-for-mvp) - https://trello.com/b/o9HIJphF/bubble-buddies-project-plan-for-mvp

[Screenshot](https://i.imgur.com/wowwZAE.png) - https://i.imgur.com/wowwZAE.png

### Wireframes

[DocHub Link](https://dochub.com/christopherhullman/a8vbNm/bubblebuddies_wireframes?dt=Y3JmoEzT-6WB7DUApmxD) - 
https://dochub.com/christopherhullman/a8vbNm/bubblebuddies_wireframes?dt=Y3JmoEzT-6WB7DUApmxD

### Evidence of Request for Code Review

[Evidence](https://i.imgur.com/jZNbUut.png) - https://i.imgur.com/jZNbUut.png

Thank you to [@jawdinmorris](https://github.com/jawdinmorris) for the code/app review

### Release History

11/05/2018 - Version 0.1 - Prototype app deployed and live to heroku using production env

### Developer and Designer

Chris Hullman - https://github.com/chullman

