module TargetSelector
  module AttackModes
    class ClosestFirst
      def self.filter(positions)
        positions.sort_by do |position| 
          DistanceCalculator.distance(position.x_coordinate,
                                      position.y_coordinate)
        end
      end
    end
  end
end
