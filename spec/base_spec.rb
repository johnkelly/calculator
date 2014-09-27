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
end
