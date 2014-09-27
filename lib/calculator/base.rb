module Calculator
  class Base
    def add(*args)
      args.map(&:to_s).map{|value| BigDecimal.new(value) }.inject(:+)
    end

    def subtract(*args)
      args.map(&:to_s).map{|value| BigDecimal.new(value) }.inject(:-)
    end

    def multiply(*args)
      args.map(&:to_s).map{|value| BigDecimal.new(value) }.inject(:*)
    end

    def divide(*args)
      args.map(&:to_s).map{|value| BigDecimal.new(value) }.inject(:/)
    end
  end
end
