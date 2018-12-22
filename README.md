# Walkthrogh of demooauth2

Demooauth2 is a OAuth demo using devise, omniauth and cancancan based on: [https://guides.rubyonrails.org/getting_started.html](https://guides.rubyonrails.org/getting_started.html) created for a [malmö.rb](http://malmorb.se/) meetup.

Prereq:  
Install ruby and rails.  
This demo is done with

```bash
$ rvm list | grep ^=
=* ruby-2.5.3 [ x86_64 ]
```

Create rails app

```bash
$ rails new demooauth2
       create
       create  README.md
       create  Rakefile
       create  .ruby-version
       create  config.ru
       create  .gitignore
       ...
       ...
       Bundle complete! 18 Gemfile dependencies, 79 gems now installed.
       Use `bundle info [gemname]` to see where a bundled gem is installed.
       run  bundle exec spring binstub --all
       * bin/rake: spring inserted
       * bin/rails: spring inserted
```

## First page

Create Home.
This will be the landing page,
the first page served and the main page we build the app around.
In the *getting_started* guide it's called *Welcome*.

```bash
$ bin/rails generate controller Home index
Running via Spring preloader in process 32410
      create  app/controllers/home_controller.rb
       route  get 'home/index'
      invoke  erb
      create    app/views/home
      create    app/views/home/index.html.erb
      invoke  test_unit
      create    test/controllers/home_controller_test.rb
      invoke  helper
      create    app/helpers/home_helper.rb
      invoke    test_unit
      invoke  assets
      invoke    coffee
      create      app/assets/javascripts/home.coffee
      invoke    scss
      create      app/assets/stylesheets/home.scss
```

Update message in app/views/home/index.html.erb

Set routing, root 'home#index' in config/routes.rb

Start rails `bin/rails server` and open a browser to [http://localhost:3000](http://localhost:3000).
Voilà, the app is started and our first page is presented

## Compliance with coding standards

So far, so good.
But, I like to have things neat and tidy so early in a project I want to make sure the code follows *standard*, add to *Gemfile*  
`gem "standard", group: [:development, :test]`

Since this is early in a greenfield development there is little danger of making *everything* prettier and better:

```bash
bundle install
bundle exec standardrb --fix
```
