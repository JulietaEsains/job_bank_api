require "test_helper"

class JobApplicationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get job_applications_index_url
    assert_response :success
  end

  test "should get show" do
    get job_applications_show_url
    assert_response :success
  end

  test "should get create" do
    get job_applications_create_url
    assert_response :success
  end

  test "should get update" do
    get job_applications_update_url
    assert_response :success
  end

  test "should get delete" do
    get job_applications_delete_url
    assert_response :success
  end
end
