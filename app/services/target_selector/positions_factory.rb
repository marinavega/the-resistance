module TargetSelector
  class PositionsFactory
    def self.call(params)
      params.map do |position_params|
        targets = TargetFactory.call(position_params['targets'])
        Radar.new(position_params['position']['x'], position_params['position']['y'], targets)
      end
    end
  end
end
