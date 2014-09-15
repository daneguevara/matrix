require 'spec_helper'
require 'matrix/network'

describe Matrix::Network do
  let(:network) { described_class.new }
  let(:city_a) { 'a' }
  let(:city_b) { 'b' }
  let(:weight) { 7 }

  describe '#add_connection' do
    subject { network.add_connection(city_a, city_b, weight) }

    context 'when a blank city name is given' do
      let(:city_a) { ' ' }

      it 'raises an argument error' do
        expect{ subject }.to raise_error(ArgumentError)
      end
    end

    context 'when a non numeric weight is given' do
      let(:weight) { 'abc' }

      it 'raises an argument error' do
        expect{ subject }.to raise_error(ArgumentError)
      end
    end
  end
  
  describe '#cities' do
    subject { network.cities }

    it 'starts with no cities' do
      expect(subject). to be_empty
    end

    context 'when the network has connected cities' do
      before(:each) { network.add_connection(city_a, city_b, weight) }

      it 'returns a list of city names' do
        expect(subject).to include(city_a, city_b) 
      end
    end
  end

  describe '#machine_cities' do
    subject { network.machine_cities }

    it 'starts with no machine cities' do
      expect(subject).to be_empty
    end

    context 'when the network has connected cities' do
      before(:each) do
        network.add_connection(city_a, city_b, weight)
        network.add_machine(city_a)
      end

      it 'returns a list of city machine names' do
        expect(subject).to include(city_a)
      end
    end
  end

end

