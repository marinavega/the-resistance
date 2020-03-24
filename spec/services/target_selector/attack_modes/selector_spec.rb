require 'rails_helper'
require 'target_selector/attack_modes/selector'
require 'target_selector/attack_modes/avoid_crossfire'

module TargetSelector
  module AttackModes
    describe Selector do
      it 'filters out any radar position containing human targets' do
        subject = Selector.new
        expect(subject.select('avoid-crossfire')).to eql(AvoidCrossfire)
      end
    end
  end
end
