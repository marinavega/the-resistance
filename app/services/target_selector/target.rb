module TargetSelector
  class Target
    attr_reader :type, :damage

    def initialize(type, damage)
      @type = type
      @damage = damage
    end
  end
end
