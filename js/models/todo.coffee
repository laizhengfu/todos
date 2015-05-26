window.app = window.app || {}
window.app.Todo = Backbone.Model.extend
  defaults:
    title: ''
    completed: false

  toggle: ->
    this.save
      completed: !this.get 'completed'