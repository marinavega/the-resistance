module TargetSelector
  class Selector
    def initialize(attack_modes, positions)
      @attack_modes = attack_modes
      @positions = positions
    end

    def position
      @positions.last
    end
  end
end
