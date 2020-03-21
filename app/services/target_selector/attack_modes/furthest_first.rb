module TargetSelector
  module AttackModes
    class FurthestFirst
      def self.filter(radar_positions)
        radar_positions.sort_by { |position| DistanceCalculator.distance(position.x_coordinate, position.y_coordinate) }.reverse
      end
    end
  end
end
