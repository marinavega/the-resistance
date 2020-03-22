module TargetSelector
  class RadarFactory
    def initialize(params)
      @params = params
    end

    def positions
      @params.map do |position_params|
        targets = TargetFactory.new(position_params['targets']).targets
        Radar.new(position_params['position']['x'], position_params['position']['y'], targets)
      end
    end
  end
end
