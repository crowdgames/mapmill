require 'test_helper'

class UtilsControllerTest < ActionController::TestCase
  test "should get consent" do
    get :consent
    assert_response :success
  end

end
