# Techvpn SDK feature factory

require_relative 'feature/base_feature'
require_relative 'feature/ratelimit_feature'
require_relative 'feature/retry_feature'
require_relative 'feature/test_feature'
require_relative 'feature/timeout_feature'


module TechvpnFeatures
  def self.make_feature(name)
    case name
    when "base"
      TechvpnBaseFeature.new
    when "ratelimit"
      TechvpnRatelimitFeature.new
    when "retry"
      TechvpnRetryFeature.new
    when "test"
      TechvpnTestFeature.new
    when "timeout"
      TechvpnTimeoutFeature.new
    else
      TechvpnBaseFeature.new
    end
  end
end
