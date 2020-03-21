module TargetSelector
  module AttackModes
    class PriorizeTX
      def self.filter(radar_positions)
        filtered = radar_positions.select { |position| position.targets.any? { |target| target.type == "T-X" } }

        return filtered unless filtered.empty?

        radar_positions
      end
    end
  end
end
