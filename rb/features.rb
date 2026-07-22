# Techvpn SDK feature factory

require_relative 'feature/base_feature'
require_relative 'feature/test_feature'


module TechvpnFeatures
  def self.make_feature(name)
    case name
    when "base"
      TechvpnBaseFeature.new
    when "test"
      TechvpnTestFeature.new
    else
      TechvpnBaseFeature.new
    end
  end
end
