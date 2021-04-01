# Viewing Party

Viewing party is a way for user to log in and search movies through themoviedb.com API. It also allows a user to create and view their movie night events and events that they are invited to.

## Authors

- **Jenny Branham** - [GitHub](https://github.com/jbranham)
- **Hope McGee** - [GitHub](https://github.com/hopesgit) / [LinkedIn](https://www.linkedin.com/in/hope-mcgee/)
- **Khoa Nguyen** - [GitHub](https://github.com/Omegaeye)

### Links
  * https://github.com/Omegaeye/viewing_party
  * https://www.themoviedb.org/
  * https://www.themoviedb.org/settings/api
  * http://localhost:3000/
## Table of Contents

  - [Authors](#authors)
  - [Getting Started](#getting-started)
    - [Gem File](#gem-file)
    - [Prerequisites](#prerequisites)
    - [Installing](#installing)
  - [App Demo](#app-demo)
  - [Runing the tests](#running-the-tests)
  - [Deployment](#deployment)
  - [Built With](#built-with)
  - [License](#license)

## Getting Started

### Gem File

![Screen Shot 2021-03-30 at 10 12 29 AM](https://user-images.githubusercontent.com/46826902/113021261-a4938d80-9140-11eb-8b2e-b2e15cec2f0a.png)


### Prerequisites

What things you need to install the software and how to install them

    * rails

    ```sh
    gem install rails --version 5.2.4.3
    ```

### Installing

    1. Clone Repo
    2. Install gem packages: `bundle install`
    3. Setup, Migrate and Seed the database: `rails db:(create,migrate,seed)`

## App Demo

Nagivate to and Register as a user: http://localhost:3000/
![Screen Shot 2021-03-30 at 1 01 40 PM](https://user-images.githubusercontent.com/46826902/113042806-da447080-9158-11eb-8e21-b7499ea825ac.png)

Register as User:
![Screen Shot 2021-03-30 at 1 20 52 PM](https://user-images.githubusercontent.com/46826902/113044403-d1ed3500-915a-11eb-8b2f-f238b602f5d6.png)

For more in depth demo, please visit: https://gist.github.com/Omegaeye/9838427f1822b57dcdf9f2a54aeb020c

Enjoy!


## Running the tests

In order to run all tests and see coverage run:

```
bundle exec rspec
```

In order to analyze programmer's ruby conventions and format, this app uses `gem rubocop`, run:

```
bundle exec rubocop
```

## Deployment
  * This app is screened through Travis CI before deploying to Heroku.
  * Need API Key from themoviedb.org
      * create an account https://www.themoviedb.org/
      * Apply for Api key https://www.themoviedb.org/settings/api
      * Input Api Key to application.yml, run:  
        ```
        atom config/application.yml
        ```
        ![Screen Shot 2021-03-30 at 11 08 56 AM](https://user-images.githubusercontent.com/46826902/113028529-9c3f5080-9148-11eb-935a-d39b8076bf17.png)
  * Hosted on: Heroku - https://morning-savannah-16693.herokuapp.com/

### To Deploy locally
    run: `rails s`

    Nagivate to http://localhost:3000/

    In order to use mailcatcher:
      1. `gem install mailcatcher`
      2. run `mailcatcher`
      3. go to http://127.0.0.1:1080/

## Built With

  - Ruby/Rails
  - javascript/jquery
  - HTML/CSS/Bootstrap

## License

  It is ours and ours alone.
