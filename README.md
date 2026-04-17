```markdown
# Project Overview

This project is a simple Todo web application built with Ruby on Rails.
It demonstrates the full development flow of a Rails app, including:

- Project setup
- MVC structure
- Database migrations
- CRUD operations
- Routing
- Adding new features (`due_date`, custom route)

The goal is not just to build the app, but to understand how Rails works end-to-end,
so the same process can be reused in future projects.

---

## Core Concept: MVC Architecture

Rails follows the MVC pattern:

- **Model** → handles data and database
- **View** → what the user sees (HTML pages)
- **Controller** → handles requests and connects Model + View

**Flow:**
```
User → Route → Controller → Model → View → Browser
```

---

## 1. Create a Rails App

Creates full project structure:

```bash
rails new todo_app
cd todo_app
```

Installs dependencies (gems):

```bash
bundle install
```

Key folders:

- `app/` → main code
- `config/` → routing + settings
- `db/` → database + migrations
- `bin/rails` → project-specific Rails command

---

## 2. Generate a Resource (Scaffold)

Creates a full CRUD system automatically:

```bash
bin/rails generate scaffold todo description:string
```

Generates:

- **Model** → `app/models/todo.rb`
- **Controller** → `app/controllers/todos_controller.rb`
- **Views** → `app/views/todos/`
- **Migration** → `db/migrate/...`
- **Routes** → auto-added

---

## 3. Create the Database

Creates database tables:

```bash
bin/rails db:migrate
```

**Concept:**
- Migration = "instructions to modify database"
- Migrate = "apply those changes"

---

## 4. Seed Initial Data

`db/seeds.rb`

```ruby
Todo.create(description: "wash dishes")
Todo.create(description: "fold laundry")
```

```bash
bin/rails db:seed
```

---

## 5. Run the App

```bash
bin/rails server
```

Visit: http://localhost:3000/todos

- Server listens on port 3000
- Routes requests to controller
- Controller fetches data
- View renders page

---

## 6. View Routes

```bash
bin/rails routes
```

Mapping of URL → controller → action:

```
GET  /todos → todos#index
POST /todos → todos#create
```

---

## 7. Add a New Field (Migration)

```bash
bin/rails generate migration AddDueDateToTodo due_date:datetime
bin/rails db:migrate
```

Adds a new column (`due_date`) to the database.

---

## 8. Allow New Field in Controller

```ruby
def todo_params
  params.require(:todo).permit(:description, :due_date)
end
```

---

## 9. Add a Route

`config/routes.rb`

```ruby
get '/hello', to: 'todos#hello'
```

```ruby
def hello
  respond_to do |format|
    format.html { render :hello }
    format.json { render json: "hello world!" }
  end
end
```

---

## 10. Create a View

`app/views/todos/hello.html.erb`

```erb
<h1>Hello!</h1>
```

Visit:
- http://localhost:3000/hello
- http://localhost:3000/hello.json
```
