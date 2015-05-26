window.app = window.app || {}
Workspace = Backbone.Router.extend
  routes:
    '*filter': 'setFilter'

  setFilter: (param)->
    if param
      param = param.trim()
    window.app.TodoFilter = param || ''
    app.Todos.trigger 'filter'

window.app.TodoRouter = new Workspace();
Backbone.history.start()
