require 'test_helper'

class SourcesControllerTest < ActionController::TestCase

  test "should show source" do
    get :show, :id => sources(:one).to_param
    assert_response :success
  end

end
