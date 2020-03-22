require "rails_helper"

module TargetSelector
  describe Selector do
    let(:positions) do
      [
        Radar.new(0, 20, [Target.new('T7-T', 30),
                          Target.new('HK-Bomber', 80),
                          Target.new('Human', nil)]),
        Radar.new(0, 80, [Target.new('HK-Tank', 20)]),
        Radar.new(0, 40, [Target.new('T1', 30),
                          Target.new('T-X', 80),
                          Target.new('Human', nil)])
      ]
    end

    context 'when the chosen attack mode is avoid-crossfire' do
      it 'avoids human targets' do
        attack_modes = [AttackModes::AvoidCrossfire]

        subject = Selector.new(attack_modes, positions)

        expect(subject.position).to eql(position: { x: 0, y: 80 },
                                        targets: ['HK-Tank'])
      end
    end

    context 'when the chosen attack mode is closest-first' do
      it 'priorizes closest targets' do
        attack_modes = [AttackModes::ClosestFirst]

        subject = Selector.new(attack_modes, positions)

        expect(subject.position).to eql(position: { x: 0, y: 20 },
                                        targets: %w[HK-Bomber T7-T])
      end
    end

    context 'when the chosen attack mode is furthest-first' do
      it 'priorizes furthest targets' do
        attack_modes = [AttackModes::FurthestFirst]

        subject = Selector.new(attack_modes, positions)

        expect(subject.position).to eql(position: { x: 0, y: 80 },
                                        targets: ['HK-Tank'])
      end
    end

    context 'when the chosen attack mode is priorize-tx' do
      it 'priorizes TX targets' do
        attack_modes = [AttackModes::PriorizeTX]

        subject = Selector.new(attack_modes, positions)

        expect(subject.position).to eql(position: { x: 0, y: 40 },
                                        targets: %w[T-X T1])
      end
    end
  end
end
