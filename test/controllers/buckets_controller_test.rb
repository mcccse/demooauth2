require "test_helper"

class BucketsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:one)
  end

  test "Bucket.new requires title presence" do
    bucket = Bucket.new
    assert_not bucket.save, "Saved a new bucket without a title"
  end

  test "Bucket.new requires 2 char title - fail" do
    bucket = Bucket.new(title: "a")
    assert_not bucket.save, "Saved a new bucket with title < 2 char"
  end

  test "Bucket.new requires 2 char title - success" do
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
  end
end
