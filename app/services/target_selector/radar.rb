module TargetSelector
  class Radar
    attr_reader :x_coordinate, :y_coordinate, :targets

    def initialize(x_coordinate, y_coordinate, targets)
      @x_coordinate = x_coordinate
      @y_coordinate = y_coordinate
      @targets = targets
    end
  end
end
