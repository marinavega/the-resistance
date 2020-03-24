class RadarController < ApplicationController
  def radar
    attack_modes = params['attack-mode'].map do |code|
      TargetSelector::AttackModes::Selector.new.call(code)
    end

    positions = TargetSelector::RadarFactory.new(params['radar']).positions
    position = TargetSelector::Selector.new(attack_modes, positions).position

    render json: position
  end
end
