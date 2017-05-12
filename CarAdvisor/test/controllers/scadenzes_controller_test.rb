require 'test_helper'

class ScadenzesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get scadenzes_new_url
    assert_response :success
  end

  test "should get show" do
    get scadenzes_show_url
    assert_response :success
  end

  test "should get index" do
    get scadenzes_index_url
    assert_response :success
  end

  test "should get edit" do
    get scadenzes_edit_url
    assert_response :success
  end

end
