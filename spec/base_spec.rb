require 'spec_helper'

describe Calculator::Base do
  subject { Calculator::Base.new }

  describe '#add' do
    it 'adds positive integers successfully' do
      expect(subject.add(4, 5, 10)).to eq BigDecimal.new('19')
    end

    it 'adds negative integers successfully' do
      expect(subject.add(-4, -5)).to eq BigDecimal.new('-9')
    end

    it 'adds decimals and integers successfully' do
      expect(subject.add(-4.5, -5.3333, 9.8888)).to eq BigDecimal.new('0.0555')
    end

    it 'adds decimals, integers, and gibberish successfully' do
      expect(subject.add(-4.5, -5.3333, 'wat')).to eq BigDecimal.new('-9.8333')
    end

    it 'adds decimals, integers, and gibberish starting with a number successfully' do
      expect(subject.add(-4.5, -5.3333, '.2wat')).to eq BigDecimal.new('-9.6333')
    end

    it 'throws an error if there are less than two arguments' do
      expect { subject.add(1) }.to raise_error ArgumentError
    end
  end

  describe '#subtract' do
    it 'subtracts positive integers successfully' do
      expect(subject.subtract(4, 5, 10)).to eq BigDecimal.new('-11')
    end

    it 'subtracts negative integers successfully' do
      expect(subject.subtract(-4, -5)).to eq BigDecimal.new('1')
    end

    it 'subtracts decimals and integers successfully' do
      expect(subject.subtract(-4.5, -5.3333, 9.8888)).to eq BigDecimal.new('-9.0555')
    end

    it 'adds decimals, integers, and gibberish successfully' do
      expect(subject.subtract(-4.5, -5.3333, 'wat')).to eq BigDecimal.new('0.8333')
    end

    it 'adds decimals, integers, and gibberish starting with a number successfully' do
      expect(subject.subtract(-4.5, -5.3333, '.2wat')).to eq BigDecimal.new('0.6333')
    end

    it 'throws an error if there are less than two arguments' do
      expect { subject.subtract(1) }.to raise_error ArgumentError
    end
  end

  describe '#multiply' do
    it 'multiplies positive integers successfully' do
      expect(subject.multiply(4, 5, 10)).to eq BigDecimal.new('200')
    end

    it 'multiplies negative integers successfully' do
      expect(subject.multiply(-4, -5)).to eq BigDecimal.new('20')
    end

    it 'multiplies decimals and integers successfully' do
      expect(subject.multiply(-4.5, -5.3333, 9.8888)).to eq BigDecimal.new('237.32971668')
    end

    it 'multiplies decimals, integers, and gibberish successfully' do
      expect(subject.multiply(-4.5, -5.3333, 'wat')).to eq BigDecimal.new('0')
    end

    it 'multiplies decimals, integers, and gibberish starting with a number successfully' do
      expect(subject.multiply(-4.5, -5.3333, '.2wat')).to eq BigDecimal.new('4.79997')
    end

    it 'throws an error if there are less than two arguments' do
      expect { subject.multiply(1) }.to raise_error ArgumentError
    end
  end

  describe '#divide' do
    it 'divides positive integers successfully' do
      expect(subject.divide(4, 5, 10)).to eq BigDecimal.new('0.08')
    end

    it 'divides negative integers successfully' do
      expect(subject.divide(-4, -5)).to eq BigDecimal.new('.8')
    end

    it 'divides decimals and integers successfully' do
      expect(subject.divide(-4.5, -5.3333, 9.8888)).to eq BigDecimal.new('0.08532433394046387735316113310007281')
    end

    it 'divides decimals, integers, and gibberish successfully' do
      expect(subject.divide(-4.5, -5.3333, 'wat')).to eq BigDecimal.new('Infinity')
    end

    it 'divides decimals, integers, and gibberish starting with a number successfully' do
      expect(subject.divide(-4.5, -5.3333, '.2wat')).to eq BigDecimal.new('4.218776367352295951849699065')
    end

    it 'throws an error if there are less than two arguments' do
      expect { subject.divide(1) }.to raise_error ArgumentError
    end
  end

  describe '#power' do
    it 'powers up positive integers successfully' do
      expect(subject.power(6, 2)).to eq BigDecimal.new('36')
      expect(subject.power(3, 2, 2)).to eq BigDecimal.new('81')
    end

    it 'powers negative integers successfully' do
      expect(subject.power(-4, 2)).to eq BigDecimal.new('16')
      expect(subject.power(2, -4)).to eq BigDecimal.new('0.0625')
    end

    it 'powers positive decimals and integers successfully' do
      expect(subject.power(4.5, 5.3333, 1.2)).to eq BigDecimal.new('15154.2329760675903472463909')
    end

    it 'powers negative decimals exponents by raising an error' do
      expect { subject.power(-4.5, -5.3333) }.to raise_error Math::DomainError
      expect { subject.power(-4.5, 5.3333) }.to raise_error Math::DomainError
      expect(subject.power(4.5, -5.3333)).to eq BigDecimal.new('0.000328262823190467')
    end

    it 'powers decimals, integers, and gibberish successfully' do
      expect(subject.power(-4.5, 'wat')).to eq BigDecimal.new('1')
    end

    it 'powers decimals, integers, and gibberish starting with a number successfully' do
      expect(subject.power(4.5, '.2wat')).to eq BigDecimal.new('1.35096003852061341')
    end

    it 'throws an error if there are less than two arguments' do
      expect { subject.power(1) }.to raise_error ArgumentError
    end
  end

  describe '#root' do
    it 'roots positive integers successfully' do
      expect(subject.root(9, 2)).to eq BigDecimal.new('3')
      expect(subject.root(729, 3, 2)).to eq BigDecimal.new('3')
    end

    it 'roots a postive integer with a negative root' do
      expect(subject.root(2, -4)).to eq BigDecimal.new('0.840896415')
    end

    it 'raises an error when taking the root of a negative integer' do
      expect { subject.root(-4, 2) }.to raise_error Math::DomainError
    end

    it 'roots a postive decimal with a decimal root' do
      expect(subject.root(1.5, 2.3)).to eq BigDecimal.new('1.1927829346966225')
    end

    it 'returns infinity if root zero is used' do
      expect(subject.root(-4.5, 'wat')).to eq BigDecimal.new('Infinity')
    end

    it 'roots decimals, integers, and gibberish starting with a number successfully' do
      expect(subject.root(4.5, '.2wat')).to eq BigDecimal.new('1845.28125')
    end

    it 'throws an error if there are less than two arguments' do
      expect { subject.root(1) }.to raise_error ArgumentError
    end
  end

  describe '#inverse' do
    it 'calls divide with 1 and the number' do
      allow(subject).to receive(:divide)
      subject.inverse(4)
      expect(subject).to have_received(:divide).with(1, 4)
    end
  end

  describe '#factorial' do
    it 'returns the factorial for positive integers' do
      expect(subject.factorial(5)).to eq(120)
    end

    it 'returns 1 for zero' do
      expect(subject.factorial(0)).to eq(1)
    end

    it 'returns an error for non integers or negative numbers or gibbersh' do
      expect { subject.factorial(1.4) }.to raise_error ArgumentError
      expect { subject.factorial(-1) }.to raise_error ArgumentError
      expect { subject.factorial('wat') }.to raise_error ArgumentError
    end
  end

  describe '#ln' do
    it 'returns the natural log for positive integers' do
      expect(subject.ln(5)).to eq BigDecimal.new('1.6094379124341')
    end

    it 'returns the natural log for positive decimals' do
      expect(subject.ln(0.5)).to eq BigDecimal.new('-0.693147180559945')
    end

    it 'returns the natural log for positive decimals and limited sig figs' do
      expect(subject.ln(0.5, 2)).to eq BigDecimal.new('-0.69')
    end

    it 'returns an error for negative numbers or gibbersh' do
      expect { subject.ln(-1) }.to raise_error ArgumentError
      expect { subject.ln('wat') }.to raise_error ArgumentError
    end
  end

  describe '#log' do
    it 'returns the base ten log for positive integers by default' do
      expect(subject.log(5)).to eq BigDecimal.new('0.698970004336018849738909949700692868')
    end

    it 'returns other base logs for positive integers' do
      expect(subject.log(5, 2)).to eq BigDecimal.new('2.321928094887362843932071703')
    end

    it 'returns the log for positive decimals' do
      expect(subject.log(0.5)).to eq BigDecimal.new('-0.30102999566398115026109005029930713238120159')
    end

    it 'returns the natural log for positive decimals and limited sig figs' do
      expect(subject.log(0.5, 10, 2)).to eq BigDecimal.new('-0.30')
    end

    it 'returns an error for negative numbers or gibbersh' do
      expect { subject.log(-1) }.to raise_error ArgumentError
      expect { subject.log('wat') }.to raise_error ArgumentError
    end
  end

  describe '#absolute_value' do
    it 'returns the number if positive' do
      expect(subject.absolute_value(5.656)).to eq BigDecimal.new('5.656')
    end

    it 'returns 0 if the number is 0' do
      expect(subject.absolute_value(0)).to eq BigDecimal.new('0')
    end

    it 'returns a positive version of the number if negative' do
      expect(subject.absolute_value(-5.656)).to eq BigDecimal.new('5.656')
    end
  end

  describe '#E' do
    it 'defaults to 15 digits if no argument' do
      expect(subject.E).to eq BigDecimal.new('2.71828182845905')
    end

    it 'allows the number of digits to be customized' do
      expect(subject.E(5)).to eq BigDecimal.new('2.7183')
    end
  end

  describe '#PI' do
    it 'defaults to 15 digits if no argument' do
      expect(subject.PI).to eq BigDecimal.new('3.141592653589793')
    end

    it 'allows the number of digits to be customized' do
      expect(subject.PI(2)).to eq BigDecimal.new('3.14')
    end
  end
end
