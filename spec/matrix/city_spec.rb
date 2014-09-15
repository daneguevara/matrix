require 'spec_helper'
require 'matrix/city'

describe Matrix::City do
  let(:city_a) { described_class.new('Midgar') }
  let(:city_b) { described_class.new('Narshe') }
  let(:weight) { 7 }

  describe '#name' do
    subject { city_a.name }

    it 'returns the name of the city' do
      expect(subject).to eq('Midgar')
    end
  end

  describe '#connect' do
    context 'when the given is nil' do
      let(:city_b) { nil }

      it 'raises an ArgumentError' do
        expect{ subject }.to raise_error(ArgumentError)
      end
    end

    context 'when the given city is not a Matrix::City' do
      let(:city_b) { 'Narshe' }

      it 'raises an ArgumentError' do
        expect { subject }.to raise_error(ArgumentError)
      end
    end

    context 'when the given city is the receiver city' do
      let(:city_b) { city_a }

      it 'raises an ArgumentError' do
        expect { subject }.to raise_error(ArgumentError)
      end
    end

    context 'when the given weight is non numeric' do
      let(:weight) { 'abc' }

      it 'raises an ArgumentError' do
        expect{ subject }.to raise_error(ArgumentError)
      end
    end
  end

  describe '#neighbors' do
    subject { city_a.neighbors }

    it 'starts with zero neighbors' do
      expect(subject).to be_empty
    end

    context 'when connected to another city' do
      before(:each) { city_a.connect(city_b, weight) }
    
      it 'lists the other city as a neighbor' do
        expect(subject).to include(city_b)
      end
    end
  end

  describe '#roads' do
    subject { city_a.roads }
    
    it 'starts with zero roads' do
      expect(subject).to be_empty
    end

    context 'when connected to another city' do
      before(:each) { city_a.connect(city_b, weight) }
    
      it 'list the road between the two cities' do
        expect(subject).to include(Matrix::Road.new(city_a.name, city_b.name, weight))
      end
    end
  end
end
