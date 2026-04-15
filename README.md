

1. rails new todo_app
create skeleton


2. bundle install
based gemfile install


3. bin/rails generate scaffold todo description:string 
generate scaffold
Model
Controller
Views
Migration
Route

4. bin/rails db:migrate

5. db/seeds.rb 
Todo.create(description: "wash dishes")
Todo.create(description: "fold laundry")

6. bin/rails db:seed

7. bin/rails server

8. 