require 'rails_helper'
require 'target_selector/attack_modes/avoid_crossfire'

module TargetSelector
  module AttackModes
    describe AvoidCrossfire do
      it 'filters out any radar position containing human targets' do
        human_target = Target.new('Human', nil)
        human_position = Radar.new(0, 20, [human_target, Target.new('HK-Bomber', 80)])

        non_human_target = Target.new('HK-­Tank', 20)
        non_human_position = Radar.new(0, 80, [non_human_target])

        positions = [human_position, non_human_position]

        expect(AvoidCrossfire.filter(positions)).not_to include(human_position)
      end
    end
  end
end
