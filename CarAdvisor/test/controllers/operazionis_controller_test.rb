require 'test_helper'

class OperazionisControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get operazionis_new_url
    assert_response :success
  end

  test "should get edit" do
    get operazionis_edit_url
    assert_response :success
  end

  test "should get create" do
    get operazionis_create_url
    assert_response :success
  end

  test "should get destroy" do
    get operazionis_destroy_url
    assert_response :success
  end

  test "should get update" do
    get operazionis_update_url
    assert_response :success
  end

  test "should get index" do
    get operazionis_index_url
    assert_response :success
  end

end
