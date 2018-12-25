require "test_helper"

class NotesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:one)
  end

  test "Note.new requires 2 char title - success" do
    get buckets_path
    assert_response :success

    post buckets_path,
      params: {bucket: {title: "aa", text: "bucket created successfully.", "id": "2"}}
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select "body" do |elements|
      assert_match(/Title/, elements.to_s)
      assert_match(/aa/, elements.to_s)
      assert_match(/Text/, elements.to_s)
      assert_match(/bucket created successfully/, elements.to_s)
    end
    post bucket_notes_path(980190963),
      params: {note: {name: "aa", body: "note created successfully."}}
    assert_response :redirect
    follow_redirect!
    assert_select "body" do |elements|
      assert_match(/Note/, elements.to_s)
      assert_match(/aa/, elements.to_s)
      assert_match(/Content/, elements.to_s)
      assert_match(/note created successfully/, elements.to_s)
    end
  end

  test "Note.new requires 2 char title - fail" do
    get buckets_path
    assert_response :success

    post buckets_path,
      params: {bucket: {title: "aa", text: "bucket created successfully."}}
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select "body" do |elements|
      assert_match(/Title/, elements.to_s)
      assert_match(/aa/, elements.to_s)
      assert_match(/Text/, elements.to_s)
      assert_match(/bucket created successfully/, elements.to_s)
    end
    post bucket_notes_path(980190963),
      params: {note: {name: "b", body: "note creation failed."}}
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select "body" do |elements|
      assert_no_match(/Note:/, elements.to_s)
    end
  end
end
