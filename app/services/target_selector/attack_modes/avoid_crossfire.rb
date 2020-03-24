module TargetSelector
  module AttackModes
    class AvoidCrossfire
      def self.filter(positions)
        positions.reject do |position|
          position.targets.any? { |target| target.type == 'Human' }
        end
      end
    end
  end
end
