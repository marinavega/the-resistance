module TargetSelector
  module AttackModes
    class PriorizeTX
      def self.filter(positions)
        filtered = positions.select do |position|
          position.targets.any? { |target| target.type == 'T-X' }
        end

        return filtered unless filtered.empty?

        positions
      end
    end
  end
end
