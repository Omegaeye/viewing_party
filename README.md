# Viewing Party

Viewing party is a way for user to log in and search movies through themoviedb.com API. It also allows a user to create and view their movie night events and events that they are invited to.

## Authors

- **Jenny Branham** - github - https://github.com/jbranham
- **Hope McGee** - github - https://github.com/hopesgit
- **Khoa Nguyen** - github - https://github.com/Omegaeye
https://github.com/Omegaeye/viewing_party

## Table of Contents

  - [Authors](#authors)
  - [Getting Started](#getting-started)
  - [Runing the tests](#running-the-tests)
  - [Deployment](#deployment)
  - [Built With](#built-with)
  - [License](#license)
  - [Acknowledgments](#acknowledgments)

## Getting Started

### GemFile

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
    run:
    ```
    rails s
    ```
    Nagivate to http://localhost:3000/

## Built With

  - Ruby/Rails
  - javascript/jquery
  - HTML/CSS/Bootstrap

## License

This project is licensed under the [CC0 1.0 Universal](LICENSE.md)
Creative Commons License - see the [LICENSE.md](LICENSE.md) file for
details

## Acknowledgments

  - Hat tip to anyone whose code was used
  - Inspiration
  - etc
