require 'test_helper'

class DoctorSessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get doctor_sessions_show_url
    assert_response :success
  end

end
