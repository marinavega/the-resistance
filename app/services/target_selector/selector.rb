module TargetSelector
  class Selector
    def initialize(attack_modes, positions)
      @attack_modes = attack_modes
      @positions = positions
    end

    def position
      filter_positions
      PositionParser.new(@positions.first).as_json
    end

    private

    def filter_positions
      @attack_modes.each do |attack_mode|
        @positions = attack_mode.filter(@positions)
      end
    end
  end
end
