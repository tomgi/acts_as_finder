# ActsAsFinder

This `acts_as` extension provides the capabilities for beautiful record finding by specified column(s).

## Installation

Add this line to your application's Gemfile:

    gem 'acts_as_finder'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install acts_as_finder

## Example Usage

Assume you have following model:

    class Language < ActiveRecord::Base
      acts_as_finder :short_name, :name
    end
	
And records in database:

    +----+------------+---------+
    | id | short_name | name    |
    +----+------------+---------+
    | 1  | EN         | English |
    | 2  | PL         | Polish  |
    +----+------------+---------+

Now you can use this extension like this:

    >> Language.EN
    => #<Language id: 1, short_name: "EN", name: "English"> 

    >> Language.Polish
    => #<Language id: 2, short_name: "PL", name: "Polish">
    
## Build Status
[![Build Status](https://secure.travis-ci.org/tomgi/acts_as_finder.png)](https://secure.travis-ci.org/tomgi/acts_as_finder)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
5. Push to the branch (`git push origin my-new-feature`)
6. Create new Pull Request
