require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should not have post without body" do
    post = Post.new
    # should not save the post without post.body present -> test succesful
    assert_not post.save
  end

  test "should report error" do
    assert_raises(NameError) do
      some_undefined_variable
    end
  end
end
