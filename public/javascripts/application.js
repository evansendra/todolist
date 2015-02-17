Falcon.baseTemplateUrl = "/tmpls";

var Todo = Falcon.Model.extend({
	url: 'todos',

	observables: {
		'title': '',
		'author': '',
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
		'todos': function () { return new Todos; }
	},

	observables: {
		'new_todo_text': ''
	},

	initialize: function() 
	{
    this.todos.fetch(); 
    console.log(this.todos);
	}

	// addTodo: function ()
	// {
	// 	var todo = new Todo({ text: this.new_todo_text() });

	// 	this.todos.create( todo );

	// 	this.new_todo_text('');
	// },

	// editTodo: function ( todo )
	// {
	// 	todo.set('is_editing', !todo.is_editing());
	// 	todo.set('text', todo.text());
	//  todo.set('author', todo.author());
	// 	todo.save();
	// },

	// removeTodo: function ( todo )
	// {
	// 	this.todos.destroy( todo );
	// },

	// toggleTodo: function ( todo )
	// {
	// 	todo.set('is_complete', 
	// 		!todo.is_complete());
	// 	todo.save();
	// }
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
		this.showTodosView = function() {
			var tlv = new TodoListView();
			tlv.todos.append([{'text': 'first', 'text': 'second'}]);
			this.currentView(tlv);
		};

		this.showTodosView();
	}
});

Falcon.apply(new LayoutView());