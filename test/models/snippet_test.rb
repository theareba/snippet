require 'test_helper'

class SnippetTest < ActiveSupport::TestCase
  test "should have the necessary required validators" do
    snippet = Snippet.new
    assert_not snippet.valid?
    assert_equal [:content], snippet.errors.keys
  end
end
