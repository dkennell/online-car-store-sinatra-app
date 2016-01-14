# Welcome to the Car Collection Sinatra App!

## Introduction

This app builds out car collections for individual users. 

* It includes three models (and their corresponding tables) `Owner`, `Car`, `Brand`  
* A Brand `belongs_to` a Car and a Owner `has_many` Cars. 
* Owner and Cars have a "many-to-many" relationship, so we'll need a join table. 

**Owner**

| **id**             | **name**          |
|:------------------:|:-----------------:|
| 1                  | Jim               |
| 2                  | George            |
| 3                  | Lee               |
| 4                  | Sarah             |
| 5                  | Sally             |

**Brands**

| **id**| **name**               | **Car_id** |
|:-----:|:----------------------:|:--------------|
| 1     | Ferrari                | 10            |
| 2     | Ford                   | 5             |
| 3     | VW                     | 3             |
| 4     | Honda                  | 10            |

**Cars**

| **id**             | **name**               | **year**     |
|:------------------:|:----------------------:|:------------:|
| 1                  | Corvette               | 1998         |
| 2                  | Mustang                | 2003         |
| 3                  | RX-8                   | 2001         |


#### Join Tables

Any time you have a `has_many` to `has_many` relationship, you'll need to create a join table. An example of a `has_many` to `has_many` relationship is titles and figures. A title `has_many` figures because many people hold a title over time and a figure usually `has_many` titles over their career.

Below is an example of a join table. We called it figure_titles and you should do the same for this lab. 

**brand_cars**

| **id**             | **brand_id**           | **car_id** |
|:------------------:|:----------------------:|:-------------:|
| 1                  | 3                      | 2             |
| 2                  | 3                      | 3             |
| 3                  | 2                      | 3             |
| 4                  | 1                      | 9             |
| 5                  | 4                      | 1             |


### Models

Now, use the `has_many`, `belongs_to` and `has_many, :through` macros to set up the correct associations in your models:

* A Landmark `belongs_to` a figure and a figure `has_many` landmarks.
* A title `has_many` figure_titles and many figures through figure_titles. 
* A figure `has_many` figure_titles and many titles through figure_titles.
* A figure_title `belongs_to` a figure and a title. 


**Top-Tip:** Type `tux` in your terminal in the directory of this project in order to drop into an interactive Ruby console that is connected to your models and database. Here, you can play around with creating and associating instances of the classes you create once you properly set up the above. This is a helpful way to solidify your understanding of the relationships between your models before you go into building the routes, views and forms that will allows your users to interact with them. Start out by creating a new figure, landmark and title. Then, add that landmark and title to the figures collection of landmarks and titles respectively. Keep playing around from there however you like. 

#### Test Database Migration

**Make sure to migrate your test database by running `rake db:migrate SINATRA_ENV=test`**

### Views and Controllers

You should create a Landmarks Controller and a Figures Controller. This lab is test-driven and will also require you to think outside the box to get things working. 

Your forms will need to be complex. Your form for a new figure should dynamically generate checkboxes out of the available landmarks and titles. It should also have fields for creating a new landmark and/or a new title. The controller action that catches the POST request sent by submitting this form should account for this. The same is true of you form for editing a given figure. Read the tests very carefully to understand how you should set up your forms. 



# Car::Collection::Sinatra::App

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/car/collection/sinatra/app`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'car-collection-sinatra-app'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install car-collection-sinatra-app

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/car-collection-sinatra-app. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

