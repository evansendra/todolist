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

	# # edit a todo
	# put :index, :with => :id do
	# end

	# # remove a todo
	# delete :index, :with => :id do
	# 	todo = Todo[params[:id]
	# end


  # define_method :get_todos do
		# @todos = Todo.order(:created_at).reverse.all

		# @todo_dates = []
		# today = DateTime.now
		# @todos.each do |t|
		# 	d = t.created_at
		# 	format = "%m/%e/%y %I:%M%P"
		# 	if d.mday == today.mday && 
		# 		d.month == today.month && 
		# 		d.year == today.year
		# 		format = "%I:%M%P"
		# 	end
		# 	@todo_dates.append(t.created_at.strftime(format))
		# end
  # end

  # get :index do
  # 	get_todos
		# render 'todos/index'
  # end

  post :index do
  	t = Todo.new({ :author => params[:author], :title => params[:title] })
  	if t.valid?
  		t.save
  	else
  		@errors = t.errors
  	end
  	get_todos
  	render 'todos/index'
  end

  get :api, :map => '/api/todo.json' do
  	content_type :json
  	todolist = get_todos.map do |t|
  		{ :id => t.id, :title => t.title, :author => t.author,
  			:is_completed => t.is_complete, :created_at => t.created_at,
  			:updated_at => t.updated_at }
  	end

  	todolist.to_json
  end

  post :api, :map => '/api/todos' do
	end
end