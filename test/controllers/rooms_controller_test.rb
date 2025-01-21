require "test_helper"

class RoomsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get rooms_index_url
    assert_response :success
  end

  test "should get new" do
    get rooms_new_url
    assert_response :success
  end

  test "should get create" do
    get rooms_create_url
    assert_response :success
  end

  test "should get pricing" do
    get rooms_pricing_url
    assert_response :success
  end

  test "should get description" do
    get rooms_description_url
    assert_response :success
  end

  test "should get photo_upload" do
    get rooms_photo_upload_url
    assert_response :success
  end

  test "should get update" do
    get rooms_update_url
    assert_response :success
  end
end
