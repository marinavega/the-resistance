require "rails_helper"
require "target_selector/attack_modes/furthest_first"

module TargetSelector
  module AttackModes
    describe FurthestFirst do
      let(:closest_position) { Radar.new(10, 15, [Target.new('Human', nil)]) }
      let(:furthest_position) { Radar.new(5, 90, [Target.new('HK-Bomber', 80)]) }

      it 'returns the positions sorted by distance (desc)' do
        positions = [closest_position, furthest_position]

        expect(FurthestFirst.filter(positions).first).to eql(furthest_position)
      end
    end
  end
end
