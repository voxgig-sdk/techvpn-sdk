# Techvpn SDK exists test

require "minitest/autorun"
require_relative "../Techvpn_sdk"

class ExistsTest < Minitest::Test
  def test_create_test_sdk
    testsdk = TechvpnSDK.test(nil, nil)
    assert !testsdk.nil?
  end
end
