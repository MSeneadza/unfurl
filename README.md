# Unfurl

Unfurl takes a matrix (a two dimensional array) as input and returns a string. The matrix may be of arbitrary size and must consist of uppercase English letters.  The returned string will consist of all elements of the matrix ordered in a clockwise spiral pattern starting with element [0, 0].  Each letter will be converted to lowercase and separated by a single whitespace character.
                                                                               
For example, given the following matrix:

    A B C D
    E F G H
    I J K L
                                                                               
The resulting string would be:  "a b c d h l k j i e f g"

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'unfurl'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install unfurl

## Usage

To use Unfurl: 

    require 'unfurl'

    matrix = [['A', 'B'],
             ['C', 'D']]
    Unfurl.new(matrix).process
    # => "a b d c"

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/MSeneadza/unfurl. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Unfurl project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/unfurl/blob/master/CODE_OF_CONDUCT.md).
