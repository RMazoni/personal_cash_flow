require "test_helper"

class CashFlowControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get cash_flow_url
    assert_response :success
  end
end
