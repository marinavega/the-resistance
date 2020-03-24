module TargetSelector
  class TargetFactory
    def self.call(params)
      params.map do |target_params|
        Target.new(target_params['type'],
                   target_params['damage'])
      end
    end
  end
end
