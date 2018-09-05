require 'test_helper'

class TransportControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get transport_home_url
    assert_response :success
  end

end
