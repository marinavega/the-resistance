module TargetSelector
  module AttackModes
    class AttackSelector
      MODULE = 'TargetSelector::AttackModes'

      def selector(attack_mode)
        Object.const_get("#{MODULE}::#{mode_configs[attack_mode]}")
      end

      def mode_configs
        @mode_configs ||= YAML.load_file('config/data/attack_modes.yml')
      end
    end
  end
end
