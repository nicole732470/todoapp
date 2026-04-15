Project Overview

This project is a simple Todo web application built with Ruby on Rails.
It demonstrates the full development flow of a Rails app, including:
	•	Project setup
	•	MVC structure
	•	Database migrations
	•	CRUD operations
	•	Routing
	•	Adding new features (due_date, custom route)

The goal is not just to build the app, but to understand how Rails works end-to-end, so the same process can be reused in future projects.

Core Concept: MVC Architecture

Rails follows the MVC pattern:
	•	Model → handles data and database
	•	View → what the user sees (HTML pages)
	•	Controller → handles requests and connects Model + View

Flow:

User → Route → Controller → Model → View → Browser

1. Create a Rails App
Creates full project structure： rails new todo_app
cd todo_app
Installs dependencies (gems): bundle install

Key folders:
	•	app/ → main code
	•	config/ → routing + settings
	•	db/ → database + migrations
	•	bin/rails → project-specific Rails command

2. Generate a Resource (Scaffold)
Creates a full CRUD system automatically: bin/rails generate scaffold todo description:string

Generates:
	•	Model → app/models/todo.rb
	•	Controller → app/controllers/todos_controller.rb
	•	Views → app/views/todos/
	•	Migration → db/migrate/...
	•	Routes → auto-added


3. Create the Database
Creates database tables: bin/rails db:migrate

Concept:
	•	Migration = “instructions to modify database”
	•	Migrate = “apply those changes”

4. Seed Initial Data
db/seeds.rb
Todo.create(description: "wash dishes")
Todo.create(description: "fold laundry")
bin/rails db:seed

5. Run the App
bin/rails server
http://localhost:3000/todos

	•	Server listens on port 3000
	•	Routes requests to controller
	•	Controller fetches data
	•	View renders page

6. View Routes
bin/rails routes
Mapping of URL → controller → action
GET /todos → todos#index
POST /todos → todos#create

7. Add a New Field (Migration)
bin/rails generate migration AddDueDateToTodo due_date:datetime
bin/rails db:migrate
	•	Adds a new column (due_date) to database

8. Allow New Field in Controller
def todo_params
  params.require(:todo).permit(:description, :due_date)
end

9. Add Route
config/routes.rb
get '/hello', to: 'todos#hello'

def hello
  respond_to do |format|
    format.html { render :hello }
    format.json { render json: "hello world!" }
  end
end

10.Create View
app/views/todos/hello.html.erb
<h1>Hello!</h1>

http://localhost:3000/hello
http://localhost:3000/hello.json

