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
  end
end
