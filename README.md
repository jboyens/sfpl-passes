# Sfpl::Passes

A small gem that helps you find out the state of the free museum passes are in the San Francisco Public Library system. It's not pretty, but it save me money.

## Installation

Add this line to your application's Gemfile:

    gem 'sfpl-passes'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sfpl-passes

## Usage

SFPL::Passes.available will give you the passes that should be at each branch

SFPL::Passes.due will give you the passes that are not yet in and will give you a due date for their "return"

Passing a symbol for the museum will restrict the search

```ruby
SFPL::Passes.available(:sfmoma, :exploratorium)
```

Available libraries are:
  * exploratorium
  * asian_art
  * california_academy_of_sciences
  * aquarium_of_the_bay
  * cartoon_art_museum
  * conservatory_of_flowers
  * sfmoma
  * sfzoo
  * childrens_creativity_museum

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
