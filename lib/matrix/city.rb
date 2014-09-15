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
    def connect(city, weight)
      city_roads[city] = Road.new(self, city, weight)
      city.city_roads[self] = city_roads[city]
    end

    def eql?(other)
      [name, neighbors] == [other.name, other.neighbors]
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

    alias_method :==, :eql?

    protected

    # Protected: Returns a Hash of Roads from this City to other Cities indexed by those Cities.
    attr_reader :city_roads
  end
end
