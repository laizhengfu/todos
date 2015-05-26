window.app = window.app || {}
window.app.TodoView = Backbone.View.extend
  tagName: 'li'
  template: _.template $('#item-template').html()

  events:
    'click .toggle': 'togglecompleted'
    'dblclick label': 'edit'
    'click .destroy': 'clear'
    'keypress .edit': 'updateOnEnter'
    'blur .edit': 'close'

  initialize: ->
    this.listenTo this.model, 'change', this.render
    this.listenTo this.model, 'destroy', this.remove
    this.listenTo this.model, 'visible', this.toggleVisible

  render: ->
#    if (this.model.changed.id !== undefined) {
#    return;
#}
#
#this.$el.html(this.template(this.model.toJSON()));
#this.$el.toggleClass('completed', this.model.get('completed'));
#this.toggleVisible();
#this.$input = this.$('.edit');
#return this;


    if this.model.changed.id != undefined
      return

    this.$el.html this.template(this.model.toJSON())
    this.$el.toggleClass 'completed', this.model.get('completed')
    this.toggleVisible()
    this.$input = this.$('.edit')
    this

  toggleVisible: ->
    this.$el.toggleClass 'hidden', this.isHidden()

  isHidden: ->
    isCompleted =  this.model.get 'completed'
    (!isCompleted && app.TodoFilter == 'completed') || (isCompleted && app.TodoFilter == 'active')

  togglecompleted: ->
    this.model.toggle()

  edit: ->
    this.$el.addClass 'editing'
    this.$input.focus()

  close: ->
    value = this.$input.val().trim()
    if value
      this.model.save
        title:value
    this.$el.removeClass 'editing'

  updateOnEnter: (e)->
    if e.which == ENTER_KEY
      this.close()

  clear: ->
    this.model.destroy()