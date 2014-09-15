module Matrix
  class Network

    def initialize
      @cities_hash = {}
    end

    def add_connection(a, b, weight)
      raise ArgumentError.new('City name is blank.') if [a, b].any?(&:blank?)
      raise ArgumentError.new('Non numeric weight.') unless weight.is_a?(Numeric)

      add_or_find_city(a).connect(add_or_find_city(b), weight)
    end

    def add_machine(name)
      cities_hash[name] && cities_hash[name].machine? || cities_hash[name].toggle_machine
    end

    def cities
      cities_hash.keys
    end

    def machine_cities
      cities_hash.values.select(&:machine?).map(&:name)
    end

    private

    attr_reader :cities_hash

    def add_or_find_city(name)
      cities_hash[name] ||= City.new(name)
    end

  end
end
