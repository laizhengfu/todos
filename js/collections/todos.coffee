window.app = window.app || {}
window.app.TodoList = Backbone.Collection.extend
  model: app.Todo
  localStorage: new Backbone.LocalStorage 'todos-backbone'
  completed: ->
    this.filter((todo)->
      todo.get 'completed'
    )
  remaining: ->
    this.without.apply this, this.completed()

  nextOrder: ->
    if !this.length
      return 1
    this.last().get('order') + 1

  comparator: (todo)->
    todo.get 'order'

window.app.Todos = new app.TodoList()