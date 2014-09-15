require 'active_support/all'
require 'matrix/road'

module Matrix

  # Public: A Class to represent a city and its surrounding neighbors.
  class City

    # Public: Get the name of the city.
    #
    # Returns an Object.
    attr_reader :name

    # Public: Use the City name for display methods.
    delegate :to_s, :inspect, to: :name

    # Public: Get the Road to another City by indexing Roads by Cities.
    #
    # Returns a Matrix::Road.
    delegate :[], to: :city_roads

    def initialize(name)
      @name = name
      @city_roads = {}
    end

    # Public: Connect this City to another.
    #
    # city - A Matrix::City.
    def connect(other, weight)
      raise ArgumentError.new('Invalid city.') unless other && other.kind_of?(City) && !eql?(other)
      raise ArgumentError.new('Non numeric weight.') unless weight.kind_of?(Numeric)
      
      city_roads[other] = Road.new(self, other, weight)
      other.city_roads[self] = city_roads[other]
    end

    def eql?(other)
      other.kind_of?(City) && [name, neighbors] == [other.name, other.neighbors]
    end

    # Public: Check if this City has a machine.
    #
    # Returns True or False.
    def machine?
      !!machine
    end

    # Public: Get neighboring Cities.
    #
    # Returns an Array of Matrix::City objects.
    def neighbors
      city_roads.keys
    end

    # Public: Get Roads to neighboring Cities.
    #
    # Returns an Array of Matrix::Road objects.
    def roads
      city_roads.values
    end

    # Public: Add or remove a machine to this City.
    def toggle_machine
      @machine = !machine
    end

    alias_method :==, :eql?

    protected

    # Protected: Returns a Hash of Roads from this City to other Cities indexed by those Cities.
    attr_reader :city_roads

    private

    # Internal: Returns a truthy value representing whether or not this city has a machine.
    attr_reader :machine
  end
end
