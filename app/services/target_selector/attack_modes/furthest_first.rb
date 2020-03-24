module TargetSelector
  module AttackModes
    class FurthestFirst
      def self.filter(positions)
        positions.sort_by do |position| 
          DistanceCalculator.distance(position.x_coordinate,
                                      position.y_coordinate)
        end.reverse
      end
    end
  end
end
