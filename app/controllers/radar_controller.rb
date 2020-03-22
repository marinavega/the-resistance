class RadarController < ApplicationController
  def radar
    payload = JSON.parse(request.raw_post)

    attack_modes = payload['attack-mode'].map { |code| PositionParser.new.load(code) }
    positions = TargetSelector::RadarPositionsFactory.new(payload['radar']).radar_positions
    position = Selector.new(attack_modes, positions).position

    render json: position
  end
end
