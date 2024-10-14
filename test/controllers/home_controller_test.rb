require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    # ログインする
    post session_url, params: { email_address: users(:one).email_address, password: "password" }
    get root_url
    assert_response :success
  end
end
