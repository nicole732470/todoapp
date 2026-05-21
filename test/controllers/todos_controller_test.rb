require "test_helper"

class TodosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @todo = todos(:one)
  end

  test "should get index" do
    get todos_url
    assert_response :success
  end

  test "should get new" do
    get new_todo_url
    assert_response :success
  end

  test "should create todo" do
    assert_difference("Todo.count") do
      post todos_url, params: { todo: { description: @todo.description } }
    end

    assert_redirected_to todo_url(Todo.last)
  end

  test "should show todo" do
    get todo_url(@todo)
    assert_response :success
  end

  test "should get edit" do
    get edit_todo_url(@todo)
    assert_response :success
  end

  test "should update todo" do
    patch todo_url(@todo), params: { todo: { description: @todo.description } }
    assert_redirected_to todo_url(@todo)
  end

  test "should destroy todo" do
    assert_difference("Todo.count", -1) do
      delete todo_url(@todo)
    end

    assert_redirected_to todos_url
  end

  test "toggle high_priority responds with turbo_stream" do
    patch toggle_high_priority_todo_url(@todo), as: :turbo_stream

    assert_response :success
    assert_equal "text/vnd.turbo-stream.html", response.media_type
  end

  test "toggle high_priority flips high_priority in database" do
    assert @todo.high_priority

    patch toggle_high_priority_todo_url(@todo), as: :turbo_stream

    assert_not @todo.reload.high_priority
  end

  test "toggle high_priority html redirects to index" do
    patch toggle_high_priority_todo_url(@todo)

    assert_redirected_to todos_path
  end

  test "toggle high_priority turbo_stream replaces todo dom id" do
    patch toggle_high_priority_todo_url(@todo), as: :turbo_stream

    assert_match "turbo-stream", response.body
    assert_match dom_id(@todo), response.body
  end

  test "toggle high_priority off removes high priority text from stream" do
    patch toggle_high_priority_todo_url(@todo), as: :turbo_stream

    assert_no_match "High priority", response.body
  end

  test "toggle high_priority on includes high priority text in stream" do
    todo = todos(:two)

    patch toggle_high_priority_todo_url(todo), as: :turbo_stream

    assert_match "High priority", response.body
  end

  test "index shows high priority badge for high priority todo only" do
    get todos_url

    assert_response :success
    assert_select ".todo--high-priority", count: 1
    assert_select ".todo__badge", text: "High priority", count: 1
  end
end
