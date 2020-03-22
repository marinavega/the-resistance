module TargetSelector
  class PositionParser
    def initialize(position)
      @position = position
    end

    def as_json
      targets = @position.targets.map(&:type).select {|e| e != 'Human'}.reverse

      { position: { x: @position.x_coordinate,
                    y: @position.y_coordinate },
        targets: targets }
    end
  end
end
