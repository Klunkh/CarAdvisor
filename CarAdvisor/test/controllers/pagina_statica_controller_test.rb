require 'test_helper'

class PaginaStaticaControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get pagina_statica_home_url
    assert_response :success
  end

end
