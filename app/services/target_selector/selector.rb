module TargetSelector
  class Selector
    def initialize(attack_modes, radar_positions)
      @attack_modes = attack_modes
      @radar_positions = radar_positions
    end

    def position
      @radar_positions.last
    end
  end
end
