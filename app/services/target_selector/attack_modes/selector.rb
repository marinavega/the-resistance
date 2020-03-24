module TargetSelector
  module AttackModes
    class Selector
      MODULE = 'TargetSelector::AttackModes'

      def call(attack_mode)
        Object.const_get("#{MODULE}::#{mode_configs[attack_mode]}")
      end

      def mode_configs
        @mode_configs ||= YAML.load_file('config/data/attack_modes.yml')
      end
    end
  end
end
