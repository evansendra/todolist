Falcon.baseTemplateUrl = "/tmpls";

var Todo = Falcon.Model.extend({
	url: 'todos',

	observables: {
		'title': '',
		'tmp_title': '',
		'is_complete': false,
		'is_editing': false
	}
});

var Todos = Falcon.Collection.extend({
	model: Todo
});

var TodoListView = Falcon.View.extend({
	url: 'todos.html',

	defaults: {
		'todos': function () { return new Todos(); }
	},

	observables: {
		'new_todo_text': '',
		'error_text': ''
	},

	initialize: function() 
	{
    this.todos.fetch(); 
	},

	addTodo: function ()
	{		
		this.error_text('');
		var title = this.new_todo_text().trim();
		try
		{
			this.validateTitle(title, true);
			var todo = new Todo({ title: title });
			this.todos.create( todo, {attributes: ["title"], fill_options: {method: 'prepend'}});
			this.new_todo_text('');
		}
		catch (err_msg)
		{
			this.error_text(err_msg);	
		}
	},

	editTodo: function ( todo )
	{
		this.error_text('');
		todo.set('is_editing', !todo.is_editing());

		if ( todo.is_editing() )
		{
			todo.set('tmp_title', todo.title());
		}
		else
		{
			try
			{
				this.validateTitle(todo.tmp_title(), false);
				todo.set('title', todo.tmp_title());
				todo.save({attributes: ["title", "is_complete"]});
			}
			catch (err_msg)
			{
				this.error_text(err_msg);
			}
		}
	},

	removeTodo: function ( todo )
	{
		this.todos.destroy(todo);
		this.todos.remove(todo);
	},

	toggleTodo: function ( todo )
	{
		todo.set('is_complete', !todo.is_complete());
		todo.save({attributes: ["title", "is_complete"]});
	},

	validateTitle: function (title, is_new)
	{
		if (title && title.length > 0
				&& title.length < 255)
		{
			// ensure not already in list
			var position = this.todos.indexOf(function(todo) {
				return todo.get("title") === title; 
			});

			if (position !== -1 && is_new)
			{
				throw "You haven\'t finished that one yet";
			}
		}
		else
		{
			throw "Some words are needed.";
		}
		
		return true;
	}

});

/*
 * connect views via a common layout
 */
var LayoutView = Falcon.View.extend({
	url: 'layout.html',
	observables: {
		'currentView': null
	},

	initialize: function() {
		this.showTodosView = function() 
		{
			var tlv = new TodoListView();
			tlv.todos.append([{'text': 'first', 'text': 'second'}]);
			this.currentView(tlv);
		};

		this.showTodosView();
	},
});

Falcon.apply(new LayoutView());