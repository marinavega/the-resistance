module TargetSelector
  class DistanceCalculator
    def self.distance(x_coordinate, y_coordinate)
      Math.sqrt(x_coordinate * x_coordinate + y_coordinate * y_coordinate)
    end
  end
end
