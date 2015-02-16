Falcon.baseTemplateUrl = "/";
Falcon.baseApiUrl = "/api";

var Todo = Falcon.Model.extend({
	url: 'todo.json',

	observables: {
		'text': '',
		'is_complete': false,
		'is_editing': false
	}
});

var Todos = Falcon.Collection.extend({
	model: Todo
});

var TodoListView = Falcon.View.extend({
	url: 'todos',

	defaults: {
		'todos': function () { return new Todos; }
	},

	observables: {
		'new_todo_text': ''
	},

	initialize: function() 
	{
    this.todos.fetch(); 
	},

	addTodo: function ()
	{
		var todo = new Todo({ text: this.new_todo_text() });

		this.todos.create( todo );

		this.new_todo_text('');
	},

	editTodo: function ( todo )
	{
		todo.set('is_editing', !todo.is_editing());
		todo.set('text', todo.text());
		todo.save();
	},

	removeTodo: function ( todo )
	{
		this.todos.destroy( todo );
	},

	toggleTodo: function ( todo )
	{
		todo.set('is_complete', 
			!todo.is_complete());
		todo.save();
	}
});

view = new TodoListView;

Falcon.apply(view, '#application');

view.todos.append([
	{'text': 'First'},
	{'text': 'Second'},
	{'text': 'Third'}
]);