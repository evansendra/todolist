Todolist::App.controllers :todos do
  
  define_method :get_todos do
		@todos = Todo.order(:created_at).reverse.all
  end
  
  get :index do
  	get_todos
		@todo_dates = []
		today = DateTime.now
		@todos.each do |t|
			d = t.created_at
			format = "%m/%e/%y %I:%M%P"
			if d.mday == today.mday && 
				d.month == today.month && 
				d.year == today.year
				format = "%I:%M%P"
			end
			@todo_dates.append(t.created_at.strftime(format))
		end

		render 'todos/index'
  end

  get :api, :map => '/api/todos/' do
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

	# get :index, :map => '/foo/bar' do
  #   session[:foo] = 'bar'
  #   render 'index'
  # end

  # get :sample, :map => '/sample/url', :provides => [:any, :js] do
  #   case content_type
  #     when :js then ...
  #     else ...
  # end

  # get :foo, :with => :id do
  #   'Maps to url '/foo/#{params[:id]}''
  # end

  # get '/example' do
  #   'Hello world!'
  # end
end