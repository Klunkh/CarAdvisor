require 'test_helper'

class AutoveicolosControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get autoveicolos_edit_url
    assert_response :success
  end

end
