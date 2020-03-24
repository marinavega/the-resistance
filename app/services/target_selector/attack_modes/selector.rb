module TargetSelector
  module AttackModes
    class Selector
      MODULE = 'TargetSelector::AttackModes'.freeze
      ATTACK_MODES = YAML.load_file('config/data/attack_modes.yml').freeze

      def call(attack_mode)
        Object.const_get("#{MODULE}::#{ATTACK_MODES[attack_mode]}")
      end
    end
  end
end
