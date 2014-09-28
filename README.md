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

#### Multiply
```ruby
# Multiply accepts N numbers as params
# 15 * .7 * 1256 * -23.234
calculator.multiply(15, .7, 1256, -23.234)
```

#### Divide
```ruby
# Divide accepts N numbers as params
# 15 / .7 / 1256 / -23.234
calculator.divide(15, .7, 1256, -23.234)
```

#### Power
```ruby
# Multiplies a number by itself n times
# 15 ** 2
calculator.power(15, 2)

# (3 ** 2) ** 2
calculator.power(3, 2, 2)
```

#### Root
```ruby
# Finds the x root of a number n times
# (15 ** (1/2)) ** (1/3)
calculator.root(15, 2, 3)
```

#### Inverse
```ruby
# Finds the inverse for a given number
# Inverse of 5 => 0.2
calculator.inverse(5)
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'calculator', git: 'https://github.com/limitingfactor/calculator.git'
```

And then execute:

    $ bundle
