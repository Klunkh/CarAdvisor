require 'test_helper'

class ConversazionesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get conversaziones_new_url
    assert_response :success
  end

end
