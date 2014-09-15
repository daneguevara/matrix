require 'spec_helper'
require 'matrix/city'

describe Matrix::City do
  subject(:city) { Matrix::City.new(name) }
  let(:name) { 'Midgar' }

  describe '#name' do
    it 'returns the name of the city' do
      expect(subject.name).to eq(name)
    end
  end

  describe '#connect' do
    let(:city_b) { Matrix::City.new('Narshe') }
    let(:weight) { 7 }

    before(:each) { subject.connect(city_b, weight) }

    it 'adds the city as a neighbor to this city' do
      expect(subject.neighbors).to include(city_b)
    end

    it 'adds this city as a neighbor to the city' do
      expect(city_b.neighbors).to include(subject)
    end

    it 'links the two cities with a road' do
      expect(subject[city_b]).to eq(city_b[subject])
    end
  end

  describe '#neighbors' do
    it 'starts with zero neighbors' do
      expect(subject.neighbors).to be_empty
    end

    context 'when connected to another city' do
      let(:city_b) { Matrix::City.new('Narshe') }
      let(:weight) { 7 }

      before(:each) { subject.connect(city_b, weight) }
    
      it 'lists the other city as a neighbor' do
        expect(subject.neighbors).to eq([city_b])
      end
    end
  end

  describe '#roads' do
    it 'starts with zero roads' do
      expect(subject.roads).to be_empty
    end

    context 'when connected to another city' do
      let(:city_b) { Matrix::City.new('Narshe') }
      let(:weight) { 7 }

      before(:each) { subject.connect(city_b, weight) }
    
      it 'list the road between the two cities' do
        expect(subject.roads).to eq([Matrix::Road.new(subject.name, city_b.name, weight)])
      end
    end
  end
end
