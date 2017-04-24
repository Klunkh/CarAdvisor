require 'test_helper'

class OfficinasControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get officinas_show_url
    assert_response :success
  end

  test "should get edit" do
    get officinas_edit_url
    assert_response :success
  end

  test "should get index" do
    get officinas_index_url
    assert_response :success
  end

end
