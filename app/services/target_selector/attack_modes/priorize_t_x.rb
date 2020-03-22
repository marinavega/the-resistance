module TargetSelector
  module AttackModes
    class PriorizeTX
      def self.filter(positions)
        filtered = positions.select { |position| position.targets.any? { |target| target.type == "T-X" } }

        return filtered unless filtered.empty?

        positions
      end
    end
  end
end
