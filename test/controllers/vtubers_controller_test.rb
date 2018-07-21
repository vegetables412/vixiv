require 'test_helper'

class VtubersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get vtubers_show_url
    assert_response :success
  end

end
