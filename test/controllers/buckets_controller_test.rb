require "test_helper"

class BucketsControllerTest < ActionDispatch::IntegrationTest
  test "Bucket.new requires title presence" do
    bucket = Bucket.new
    assert_not bucket.save, "Saved a new bucket without a title"
  end

  test "Bucket.new requires 2 char title - fail" do
    bucket = Bucket.new(title: "a")
    assert_not bucket.save, "Saved a new bucket with title < 2 char"
  end

  test "Bucket.new requires 2 char title - success" do
    bucket = Bucket.new(title: "aa")
    assert bucket.save, "Saved a new bucket with title = 2 char"
  end
end
