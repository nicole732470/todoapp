class BackfillHighPriorityDefaultOnTodos < ActiveRecord::Migration[8.1]
  def change
    change_column_default :todos, :high_priority, from: nil, to: false
    change_column_null :todos, :high_priority, false, false
  end
end
