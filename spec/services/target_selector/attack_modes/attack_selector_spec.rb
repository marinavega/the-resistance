require 'rails_helper'
require 'target_selector/attack_modes/attack_selector'
require 'target_selector/attack_modes/avoid_crossfire'

module TargetSelector
  module AttackModes
    describe AttackSelector do
      it 'filters out any radar position containing human targets' do
        subject = AttackSelector.new
        expect(subject.select('avoid-crossfire')).to eql(AvoidCrossfire)
      end
    end
  end
end
