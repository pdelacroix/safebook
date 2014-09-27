class App.Views.messageList extends Backbone.View

  render: =>
    @collection.sort()
    messages = @collection.toJSON()

    for message in messages
      user = App.Collections.Users.findWhere(id: message.user_id)
      destination = if message.destination_type == "user"
        App.Collections.Users.findWhere(id: message.destination_id)
      else
        App.Collections.Pages.findWhere(id: message.destination_id)
      message.source = user.attributes
      message.destination = destination.attributes
      message.createdAt = (new Date(message.createdAt)).toLocaleString()

    template = Handlebars.compile $("#messageListTemplate").html()
    @$el.html template(messages: messages)
    @