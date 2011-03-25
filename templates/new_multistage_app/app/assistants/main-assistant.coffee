class MainAssistant
  setup: ->
    # this function is for setup tasks that have to happen when the scene is first created
    # use Mojo.View.render to render view templates and add them to the scene if needed

    # setup widgets here

    # add event handlers to listen to events from widgets

  activate: (event) ->
    # put in event handlers here that should only be in effect when this scene is active. For example, key handlers that are observing the document.

  deactivate: (event) ->
    # remove any event handlers you added in activate and do any other cleanup that should happen before this scene is popped or another scene is pushed on top

  cleanup: (event) ->
    # this function should do any cleanup needed before the scene is destroyed as a result of being popped off the scene stack
