
require 'matrix/road' 
describe Matrix::Road do
  subject(:road) { Matrix::Road.new(city_a, city_b, weight) }
  let(:city_a) { 'a' }
  let(:city_b) { 'b' }
  let(:weight) { 123 }

  describe '#intialize' do
    it 'initializes a new Matrix::Road' do
      expect(subject.cities << subject.weight).to eq([city_a, city_b, weight])
    end

    context 'city_a is nil' do
      let(:city_a) { nil }
      it 'raises an ArgumentError' do
        expect{subject}.to raise_error(ArgumentError)
      end
    end

    context 'city_b is nil' do
      let(:city_b) { nil }
      it 'raises an ArgumentError' do
        expect{subject}.to raise_error(ArgumentError)
      end
    end

    context 'weight is not a number' do
      let(:weight) { 'abc' }
      it 'raises an ArgumentError' do
        expect{subject}.to raise_error(ArgumentError)
      end
    end
  end

  describe '#<=>' do
    context 'another road has the same weight' do
      let(:road_2) { Matrix::Road.new('c', 'd', weight) }

      it 'returns 0' do
        expect(subject <=> road_2).to eq(0)
      end
    end

    context 'another road has a higher weight' do
      let(:road_2) { Matrix::Road.new('c', 'd', weight + 1) }

      it 'returns -1' do
        expect(subject <=> road_2).to eq(-1)
      end
    end

    context 'another road has a lower weight' do
      let(:road_2) { Matrix::Road.new('c', 'd', weight - 1) }

      it 'returns 1' do
        expect(subject <=> road_2).to eq(1)
      end
    end
  end

  describe '#eql?' do
    context 'another road has the same two cities' do
      let(:road_2) { Matrix::Road.new(city_b, city_a, weight) }

      it 'returns true' do
        expect(subject.eql?(road_2)).to eq(true)
      end
    end

    context 'another road has different cities' do
      let(:road_2) { Matrix::Road.new('c', 'd', weight) }

      it 'returns false' do
        expect(subject.eql?(road_2)).to eq(false)
      end
    end
  end

end
