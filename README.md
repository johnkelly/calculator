# Calculator

## Usage
```ruby
calculator = Calculator::Basic.new
```
#### Add
```ruby
# Add accepts N numbers as params
# 5 + .7 + 256
calculator.add(5, .7, 256)
```

#### Subtract
```ruby
# Subtract accepts N numbers as params
# 15 - .7 - -256
calculator.subtract(15, .7, -256)
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'calculator', git: 'https://github.com/limitingfactor/calculator.git'
```

And then execute:

    $ bundle
