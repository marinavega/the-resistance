class RadarController < ApplicationController
  def radar
    attack_modes = params['attack-mode'].map do |code|
      TargetSelector::AttackModes::Selector.new.call(code)
    end

    positions = TargetSelector::RadarFactory.new(params['radar']).positions
    selected_position = TargetSelector::Selector.new(attack_modes, positions).position

    render json: selected_position
  end
end
