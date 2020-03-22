module TargetSelector
  class TargetFactory
    def initialize(params)
      @params = params
    end

    def targets
      @params.map do |target_params|
        Target.new(target_params['type'],
                   target_params['damage'])
      end
    end
  end
end
