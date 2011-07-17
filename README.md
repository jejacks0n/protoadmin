# ProtoAdmin

ProtoAdmin is a Rails 3.1 interface for admin style management tools.  It's a collection of some helpers that help with
common interface patterns that I've used / seen used over the years, and generators.


## Browser Support

ProtoAdmin uses HTML5 for the markup, but not all the new tag hotness because there's a balance being made for speed and
support.  I would love to use more semantic tags, but there's typically no need for an admin interface like this.  I may
change my mind and rework the tags in a later version.

* Chrome
* Safari
* Firefox
* Opera (untested at this point)
* IE (6+) (untested at this point)
* Mobile Safari (untested and incomplete)


## The Story

I've been doing this for a long time now, and I wanted a gem that I could drop into my next Rails project and have it
ready to go.  The intention of this project isn't to provide a one size fits all sort of thing, and is more about
providing a good starting point.  You will have to add your own stuff and tweak things, but I've tried to make that
pretty easy for the common things.


## Installation

Include the gem in your Gemfile and bundle to install the gem.

    gem 'protoadmin'


## Usage

Any controller that you want to be part of the admin interface should inherit from `Protoadmin::ApplicationController`.

    class ArticlesController < Protoadmin::ApplicationController

ProtoAdmin comes with all the standard rails generators.  Just prefix them with `protoadmin:` -- so use
`protoadmin:scaffold` for instance instead of `scaffold`.

    rails generate protoadmin:scaffold post title:string body:text published:boolean


## Customizing

I follow some common patterns that will help simplify customization.  There's three main patterns that I've followed.

### Partials

I've broken some specific layout aspects into partials.

* */layouts/protoadmin/_primary_control* User information and navigation.
* */layouts/protoadmin/_primary_content* Flash messages and yield.
* */layouts/protoadmin/_additional_info* Copyright and MediaLoot link.

You can replace any of these partials by placing your own partials in the same paths in your application.  Your partials
will be used instead.  It's obviously up to you to maintain support for whatever browsers you need for your specific
case, but by default there's good support for mobile devices regarding the layout.


### Helper Methods

I've provided a ton of helpers that will get you started.  Helpers are one of the easiest things to override and change.
If you want to change how a helper method is working, just reopen the module and define your own.

#### Layout Helpers

#### Container Helpers

#### Forms Helpers

#### Lists Helpers

#### Details Helpers



## Project Details

There's a ton of new hotness around, and I considered using them.  But I was also trying to craft a balance between ease
of use, learning curve, performance, and browser support.  Taking all of these aspects into account I chose some pretty
standard libraries and didn't go nuts on new hotness.

### The Code and Why

#### Rails 3.1

There's some great new handling for views.. It makes me happy to see this finally, and I wanted to take advantage of it.
I really like Haml and Sass, and the asset pipeline is pretty awesome with this stuff now too.

#### CoffeeScript

It's just nicer to work with.  Classical inheritance, etc, etc.

#### jQuery

Because everyone and their kids seems to be using it.  I prefer other libraries, but if you want to tack some plugins in
for your own purposes it makes it easier, so who am I to argue.

#### HeadJS

#### PJax

#### Resourcy


## License

Licensed under the [MIT License](http://creativecommons.org/licenses/MIT/)

Copyright 2011 [Jeremy Jackson](https://github.com/jejacks0n)