// Generated by CoffeeScript 1.8.0
(function() {
  window.app = window.app || {};

  window.app.Todo = Backbone.Model.extend({
    defaults: {
      title: '',
      completed: false
    },
    toggle: function() {
      return this.save({
        completed: !this.get('completed')
      });
    }
  });

}).call(this);

//# sourceMappingURL=todo.js.map
