// Falcon.baseTemplateUrl = "/";
// Falcon.baseApiUrl = "/api";

// var Todo = Falcon.Model.extend({
// 	url: 'todo',

// 	observables: {
// 		'text': '',
// 		'is_complete': false
// 	}
// });

// var Todos = Falcon.Collection.extend({
// 	model: Todo
// });

// var TodoListView = Falcon.View.extend({
// 	url: '#todo_list_tmpl',

// 	defaults: {
// 		'todos': function () { return new Todos; }
// 	},

// 	observables: {
// 		'new_todo_text': ''
// 	},

// 	initialize: function() {},

// 	addTodo: function ()
// 	{
// 		var todo = new Todo({ text: this.new_todo_text() });

// 		this.todos.append( todo );

// 		this.new_todo_text('');
// 	},

// 	removeTodo: function ( todo )
// 	{
// 		this.todos.remove( todo );
// 	},

// 	toggleTodo: function ( todo )
// 	{
// 		todo.set('is_complete', 
// 			!todo.is_complete());
// 	}
// });

// view = new TodoListView;

// Falcon.apply(view, '#application');

// view.todos.append([
// 	{'text': 'First'},
// 	{'text': 'Second'},
// 	{'text': 'Third'}
// ]);