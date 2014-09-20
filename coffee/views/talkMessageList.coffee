class App.Views.talkMessageList extends Backbone.View

  initialize: =>
    super
    @render()

  render: =>
    template = Handlebars.compile $("#messageListTemplate").html()
    @$el.html template(messages: App.Collections.Messages.toJSON())
    @
