require "test_helper"

class TodoTest < ActiveSupport::TestCase
  test "high_priority defaults to false" do
    todo = Todo.new(description: "Test todo")

    assert_not todo.high_priority
  end

  test "can save with high_priority true" do
    todo = Todo.create!(description: "Urgent", high_priority: true)

    assert todo.high_priority
  end
end
