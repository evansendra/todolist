Todolist::App.controllers :todos do

	# get all todos
	get :index do
		content_type :json
		Todo.order(:created_at).reverse.all.to_json
	end

	# create a new todo
	post :index do
		todo = Todo.from_json(request.body.read)
		begin
			if (todo.save)
				todo.to_json
			end
		rescue false
			halt 500
		end
	end

	# complete a todo, edit a todo
	put :index, :with => :id do
		content_type :json
		todo = Todo[params[:id]]
		if todo
			t_json = JSON.parse(request.body.read)
			begin 
				todo.update(:title => t_json["title"],
					:is_complete => t_json["is_complete"])
				return true
			rescue => error
				puts error
				halt 500
			end
		else
			halt 500
		end
	end

	# remove a todo
	delete :index, :with => :id do
		if !Todo[params[:id]].destroy
			halt 500
		end 
	end
end