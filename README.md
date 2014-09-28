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

#### Factorial
```ruby
# Finds the factorial for a given number
# 5! => 5 * 4 * 3 * 2 * 1
calculator.factorial(5)
```

#### E
```ruby
# Finds Euler's number to N digits defaults 15 digits
calculator.E     # 15 digits (default)
calculator.E(30) # 30 digits
```

#### PI
```ruby
# Finds PI to N digits defaults 15 digits
calculator.PI     # 15 digits (default)
calculator.PI(30) # 30 digits
```

#### ln
```ruby
# Finds the natural log defaults 15 digits
calculator.ln(5)     # 15 digits (default)
calculator.ln(5, 30) # 30 digits
```

#### log
```ruby
# Finds the log defaults to base 10 and 15 digits
calculator.log(5)        # base 10 & 15 digits (default)
calculator.log(5, 3, 30) # base 3  & 30 digits
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'calculator', git: 'https://github.com/limitingfactor/calculator.git'
```

And then execute:

    $ bundle
