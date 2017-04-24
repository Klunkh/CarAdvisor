require 'test_helper'

class AutoveicoloControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get autoveicolo_show_url
    assert_response :success
  end

end
