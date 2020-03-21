module TargetSelector
  module AttackModes
    class AvoidCrossfire
      def self.filter(radar_positions)
        radar_positions.reject { |position| position.targets.any? { |target| target.type == "Human" } }
      end
    end
  end
end
