module Calculator
  class Base
    DEFAULT_SIGNIFICANT_FIGURES = 15

    def add(*args)
      fail ArgumentError unless args.flatten.length > 1
      args.flatten.map(&:to_s).map { |value| BigDecimal.new(value) }.inject(:+)
    end

    def subtract(*args)
      fail ArgumentError unless args.flatten.length > 1
      args.flatten.map(&:to_s).map { |value| BigDecimal.new(value) }.inject(:-)
    end

    def multiply(*args)
      fail ArgumentError unless args.flatten.length > 1
      args.flatten.map(&:to_s).map { |value| BigDecimal.new(value) }.inject(:*)
    end

    def divide(*args)
      fail ArgumentError unless args.flatten.length > 1
      args.flatten.map(&:to_s).map { |value| BigDecimal.new(value) }.inject(:/)
    end

    def power(*args)
      fail ArgumentError unless args.flatten.length > 1
      args.flatten.map(&:to_s).map { |value| BigDecimal.new(value) }.inject(:**)
    end

    def root(*args)
      fail ArgumentError unless args.flatten.length > 1
      args_copy = args.flatten[1..-1].map { |number| inverse(number) }.unshift(args[0])
      power(args_copy)
    rescue FloatDomainError
      BigDecimal.new('Infinity')
    end

    def inverse(number)
      divide(1, number)
    end

    def factorial(number)
      fail ArgumentError unless Integer(number) >= BigDecimal.new(0)
      number.to_i == 0 ? 1 : multiply(*(1..number))
    end

    def ln(number, decimal_places = DEFAULT_SIGNIFICANT_FIGURES)
      fail ArgumentError unless BigDecimal.new(number.to_s) > BigDecimal.new(0)
      BigMath::log(BigDecimal.new(number.to_s), decimal_places).truncate(decimal_places)
    end

    def log(number, base = 10, decimal_places = DEFAULT_SIGNIFICANT_FIGURES)
      fail ArgumentError unless BigDecimal.new(number.to_s) > BigDecimal.new(0)
      divide(ln(BigDecimal.new(number.to_s), decimal_places), ln(BigDecimal.new(base.to_s), decimal_places))
    end

    def absolute_value(number)
      value = BigDecimal.new(number.to_s)
      value.sign > BigDecimal.new(0) ? value : (BigDecimal.new(-1) * value)
    end

    def E(decimal_places = DEFAULT_SIGNIFICANT_FIGURES)
      BigMath::E(decimal_places).truncate(decimal_places)
    end

    def PI(decimal_places = DEFAULT_SIGNIFICANT_FIGURES)
      BigMath::PI(decimal_places).truncate(decimal_places)
    end
  end
end
