class AppAssistant
  # the reference to the app controller (this.controller) has not been established yet, so any initialization that needs the app controller should be done in the setup function below
  setup: ->
    # this function is for setup tasks that have to happen when the app is first created.
    # This should be used to initialize any application-level data structures
  considerForNotification: (notificationData) ->
    # This function is called if all other notification commanders do not process a particular sendToNotification call. The assistant may perform any default processing here if desired.
  handleLaunch: (params) ->
    # This function is called after the application has launched by the user or the applicationManager service. This may be called while the app is already running.
    # This function should handle any application-defined commands stored in the params field and launch the main stage, if necessary
    stageController = @controller.getStageProxy 'main'
    if stageController
      stage.delegateToSceneAssistant('handleLaunch', params)
    else
      # The stage has not been created, initialize it and push the main scene after initialization
      @controller.createStageWithCallback
        name: 'main'
        lightweight: 'true'
      ,
        (stageController) ->
          stageController.pushScene('main', params)
        Mojo.Controller.StageType.card
    cleanup: ->
      # this function should do any cleanup needed before the app is destroyed
