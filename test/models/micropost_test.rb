require 'test_helper'

class MicropostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @user = users(:michael)
    @micropost = @user.Microposts.build(content: "hello world!")
  end

  test "should be valid" do
    assert @micropost.valid?
  end

  test "user_id should be present" do
    @micropost.user_id=nil
    assert_not @micropost.valid?
  end

  test "content shold be present" do
    @micropost.content = "    "
    assert_not @micropost.valid?
  end

  test "content should be less than 140 character" do
    @micropost.content = "a" * 141
    assert_not @micropost.valid?
  end

  test "most recent micropost should be first" do
    assert_equal microposts(:most_recent), Micropost.first
  end

end
