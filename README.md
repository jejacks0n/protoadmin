# Protoadmin

[![Build Status](https://secure.travis-ci.org/jejacks0n/protoadmin.png)](http://travis-ci.org/jejacks0n/protoadmin)
[![Dependency Status](https://gemnasium.com/jejacks0n/protoadmin.png)](https://gemnasium.com/jejacks0n/protoadmin)
[![Code Climate](https://codeclimate.com/badge.png)](https://codeclimate.com/github/jejacks0n/protoadmin)

ProtoAdmin is a Rails 3 engine that provides a framework for building admin style management tools.  It's a collection
of css, javascript, view helpers, common libraries that help bootstrap your application with common interface patterns
that I've used over the years.

Protoadmin is intended to be dropped into your next Rails project and will provide you with a pretty great mobile
friendly interface and some fantasic interface enhancements.  It includes a basic mobile friendly design, many drop in
css and javascript modules that include everything from pjax to special inputs and interfaces.  It's designed to be
modular and flexible.


## The Story

Protoadmin is ready to go out of the box without having to worry about finding / patching several of the things that
it utilizes together yourself.  The intention of this project isn't to provide a one size fits all sort of thing,
and is more about providing an awesome starting point that you can easily utilize and that doesn't get in your way.

You can even drop it into an existing project and start getting benefits right away.  It expects only that you start
adding some css classes to elements and `rel="module"` attributes if you want to take advantage of the javascript
that it ships with.

Protoadmin is not an admin system like [Rails Admin](https://github.com/sferik/rails_admin) (also a great tool) that
tries to render the database generically, but rather a framework that provides generators and the ability to follow
your standard workflow with a Rails app.

It's not expected that everyone will agree on what Protoadmin provides, but if you're into these things it'll get you
going quickly and without fuss.

Here's some of the great libraries that Protoadmin utilizes:

- Haml
- Sass
- CoffeeScript
- Twitter Bootstrap (bootstap-sass)
- Font Awesome
- Navigasmic
- Devise (with an admin resource)
- Simple Form (with bootstrap support)

There are several Javascript libraries as well:

- jQuery
- Chosen
- Gritter
- Datatable
- Pjax


## Installation

Include the gem in your Gemfile and bundle to install the gem.

    gem 'protoadmin'

Run the install generator.

    rails g protoadmin:install

Migrate the database to get the admin table, and a default admin user (only in development).

    rake db:migrate

Start, and navigate to your server (http://localhost:3000/admin)[http://localhost:3000/admin] and provide the
credentials that you entered when you installed.  The default credentials are:

    admin@protoadmin.com
    password


## Usage

Any controller that you want to be part of the admin interface should inherit from `Protoadmin::ApplicationController`.

    class ArticlesController < Protoadmin::ApplicationController

The install generator puts a `protoadmin.rb` file into your `config/initializers` path.  This file can be adjusted to
provide additional navigation as well providing the devise and simple_form configurations.


## Screen Shots

Coming soon...


## License

Licensed under the [MIT License](http://creativecommons.org/licenses/MIT/)

Copyright 2012 [Jeremy Jackson](https://github.com/jejacks0n)
