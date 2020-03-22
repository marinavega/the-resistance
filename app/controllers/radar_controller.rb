class RadarController < ApplicationController
  def radar
    payload = JSON.parse(request.raw_post)

    attack_modes = payload['attack-mode'].map do |code|
      TargetSelector::AttackModes::AttackSelector.new.select(code)
    end

    positions = TargetSelector::RadarFactory.new(payload['radar']).positions
    position = TargetSelector::Selector.new(attack_modes, positions).position

    render json: position
  end
end
