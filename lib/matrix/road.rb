module Matrix

  # Public: A Class to represent the weight of a road between two connected cities.
  class Road
    include Comparable

    attr_reader :cities, :weight

    # Public: Initialize a new Matrix::Network::Road.
    #
    # city_a - The first Matrix::City.
    # city_b - The second Matrix::City.
    # weight - The weight of the road.
    def initialize(city_a, city_b, weight)
      raise ArgumentError unless city_a && city_b && weight.is_a?(Numeric)
      @cities = [city_a, city_b]
      @weight = weight
    end

    def <=>(other)
      weight <=> other.weight
    end

    def eql?(other)
      cities.sort == other.cities.sort
    end
  end
end
