require "test_helper"

class NotesControllerTest < ActionDispatch::IntegrationTest
  test "Note.new requires 2 char title - success" do
    bucket = Bucket.new(title: "test bucket")
    bucket.save
    note = bucket.notes.create(name: "aa")
    assert note.save, "Saved a note with two char name"
  end
  test "Note.new requires 2 char title - fail" do
    bucket = Bucket.new(title: "test bucket")
    bucket.save
    note = bucket.notes.create(name: "a")
    assert_not note.save, "Saved a note with one char name"
  end
end
