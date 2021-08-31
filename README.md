# YAHL7 (yet another HL7 client)

[![Ruby](https://github.com/mylanconnolly/yahl7/actions/workflows/main.yml/badge.svg?branch=main)](https://github.com/mylanconnolly/yahl7/actions/workflows/main.yml)
[![Gem Version](https://badge.fury.io/rb/yahl7.svg)](https://badge.fury.io/rb/yahl7)

> **NOTE** Until this gem reaches version 1.0, you should consider the API to be
> unstable and minor or major changes may occur with any release. Once version
> 1.0 has been released, the API will be stable for all 1.x release in keeping
> with [Semantic Versioning](https://semver.org/).

This gem is used to parse HL7 data from strings or IO sources in Ruby. We
currently support any version of HL7 >= 2 and < 3 (which came with a change to
XML).

An emphasis will be placed on making this robust and able to handle differing
interpretations of the HL7 standard, since it has been my experience that not
all systems implement HL7 in a consistent fashion.

This gem also aims to help performance when filtering out HL7 messages by lazily
parsing the data on demand.

There are no runtime dependencies of this gem outside of the standard library.

This gem is tested against the following platforms:

- Latest Windows Server 2019
  - Latest Ruby 2.7
  - Latest Ruby 3.0
- Latest Ubuntu Server 20.04
  - Latest Ruby 2.7
  - Latest Ruby 3.0
  - Latest TruffleRuby
- Latest macOS
  - Latest Ruby 2.7
  - Latest Ruby 3.0
  - Latest TruffleRuby

This should ensure that the code is reasonably cross-platform.

## Installation

Install the gem globally:

```bash
gem install 'yahl7'
```

Or add the following to your Gemfile:

```ruby
gem 'yahl7'
```

## Usage

This gem is fairly flexible in how you parse information. Some of the options
are illustrated below:

### To parse a single HL7 message string

```ruby
msg = YAHL7::V2::Message.parse(string_containing_single_message)
msg[0]     # To return the first segment in the message
msg['OBX'] # To return all segments of type OBX

# You can also iterate through the segments in order:
msg.each do |segment|
  # Do something with the segment
end
```

### To parse multiple HL7 messages

Note that a file is used in this example, but this should work with any IO
source, like a `StringIO` or `STDIN`.

```ruby
File.open(filename, 'r') do |file|
  parser = YAHL7::V2::Parser.new(file)

  parser.each do |msg|
    # Do something with the message; the API will be the same as the single HL7
    # example shown above
  end
end
```

If you have a string that has multiple HL7 messages, you can use that, as well.

```ruby
parser = YAHL7::V2::Parser.new(string_containing_multiple_messages)

parser.each do |msg|
  # Do something with the message; the API will be the same as the single HL7
  # example shown above
end
```

### Handling formatted HL7 fields

HL7 has its own formatting language. This language is mostly supported. Any
varianced are listed in the [ERRATA](ERRATA.md) document. Some example uses are
shown below (note that the double backslashes are just to make Ruby happy, in
the HL7 message itself, there would only be one backslash):

```ruby
formatter = YAHL7::V2::Formatter.new

formatter.format('Hello~World')
#=> "Hello\nWorld"

formatter.format('Hello\\R\\World')
#=> 'Hello~World'

formatter.format('\\.ti4\\Hello World')
#=> '    Hello World'
```

### Handling HL7 timestamps

The HL7 timestamp format is specific to HL7 and must be parsed as such. To make
this easier, we have a helper module for this. Some example uses are shown
below:

```ruby
# To parse a DateTime accurate to the year
YAHL7::V2::DateTime.parse('2012')

# To parse a DateTime accurate to the month
YAHL7::V2::DateTime.parse('201205')

# To parse a DateTime accurate to the day
YAHL7::V2::DateTime.parse('20120505')

# To parse a DateTime accurate to the hour
YAHL7::V2::DateTime.parse('2012050513')

# To parse a DateTime accurate to the minute
YAHL7::V2::DateTime.parse('201205051325')

# To parse a DateTime accurate to the second
YAHL7::V2::DateTime.parse('20120505132510')

# To parse a DateTime accurate to the second with a timezone offset. Note that
# this timezone offset can be applied to any other format shown above.
YAHL7::V2::DateTime.parse('20120505092510-0400')
```

### Convenience methods

Some segment types have convenience methods defined to make it easier to get
specific data points. Some examples are shown below:

```ruby
segment = YAHL7::V2::Segment::PID.new('PID|...')
segment.patient_name
#=> [patient name]

segment.datetime_of_birth
#=> [patient DOB]
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run
`rake spec` to run the tests. You can also run `bin/console` for an interactive
prompt that will allow you to experiment.

## Contributing

Bug reports and pull requests are welcome on GitHub at
https://github.com/mylanconnolly/yahl7. This project is intended to be a
safe, welcoming space for collaboration, and contributors are expected to adhere
to the
[code of conduct](https://github.com/mylanconnolly/yahl7/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the
[MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the HL7 project's codebases, issue trackers, chat rooms
and mailing lists is expected to follow the
[code of conduct](https://github.com/mylanconnolly/yahl7/blob/main/CODE_OF_CONDUCT.md).
