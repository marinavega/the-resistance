module TargetSelector
  class PositionParser
    def initialize(position)
      @position = position
    end

    def as_json
      targets = @position.targets.map(&:type).reject {|e| e == 'Human'}

      { position: { x: @position.x_coordinate,
                    y: @position.y_coordinate },
        targets: targets }
    end
  end
end
