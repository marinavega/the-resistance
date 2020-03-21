require 'rails_helper'
require 'target_selector/attack_modes/priorize_t_x'

module TargetSelector
  module AttackModes
    describe PriorizeTX do
      let(:t_x_target) { Target.new('T-X', 50) }
      let(:t_x_position) { Radar.new(10, 15, [t_x_target, Target.new('Human', nil)]) }
      let(:non_t_x_position) do
        Radar.new(5,
                  90,
                  [Target.new('HK-Bomber', 80),
                   Target.new('T7-T', 30)])
      end
      let(:non_t_x_position_b) do
        Radar.new(5,
                  90,
                  [Target.new('Human', 0)])
      end

      context 'when a T-X target is present' do
        it 'returns positions with T-X targets in them' do
          positions = [t_x_position, non_t_x_position]

          expect(PriorizeTX.filter(positions)).to include(t_x_position)
        end

        it 'returns the original list of positions if there are not T-X targets in them' do
          positions = [non_t_x_position, non_t_x_position_b]

          expect(PriorizeTX.filter(positions)).to eql(positions)
        end
      end
    end
  end
end
