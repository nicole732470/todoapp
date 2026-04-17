# Homework 3 Rails Todo Enhancements + Deployment

## Part 1 App Enhancements

---

### 1) Add a `done` field

#### Files changed
- db/migrate/XXXXXXXX_add_done_to_todos.rb
- app/controllers/todos_controller.rb
- app/views/todos/_form.html.erb
- app/views/todos/index.html.erb
- app/views/todos/show.html.erb

#### Code added or modified

**Migration**
```ruby
class AddDoneToTodos < ActiveRecord::Migration[7.0]
  def change
    add_column :todos, :done, :boolean, default: false, null: false
  end
end
```

**Controller (strong params)**
```ruby
def todo_params
  params.require(:todo).permit(:description, :due_date, :done)
end
```

**Form (`_form.html.erb`)**
```erb
<div>
  <%= form.label :done %>
  <%= form.check_box :done %>
</div>
```

**Index view**
```erb
<p>
  <strong>Done:</strong>
  <%= todo.done ? "Yes" : "No" %>
</p>
```

**Show view**
```erb
<p>
  <strong>Done:</strong>
  <%= @todo.done ? "Yes" : "No" %>
</p>
```

---

### 2) Add a custom route named `new_todo`

#### Files changed
- config/routes.rb

#### Code added
```ruby
get "/new_todo", to: "todos#new", as: "new_todo"
```

---

### 3) Set the homepage

#### Files changed
- config/routes.rb

#### Code added
```ruby
root "todos#index"
```

---

## Part 2 Deploy to Heroku

#### Files changed
- Gemfile
- Gemfile.lock

#### Code added
```ruby
group :production do
  gem "pg", "~> 1.1"
end
```

#### Deployment steps
```bash
git add .
git commit -m "Finish hw3"

heroku login
heroku apps:create
heroku addons:create heroku-postgresql:essential-0

git push heroku main

heroku run rails db:migrate
```

---

**Deployed application link:**
https://serene-refuge-69468-8c1dcceb5e3e.herokuapp.com/