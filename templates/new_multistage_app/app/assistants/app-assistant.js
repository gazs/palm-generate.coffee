function AppAssistant() {
	/* this is the creator function for your app assistant object. The reference
	   to the app controller (this.controller) has not be established yet, so any initialization
	   that needs the app controller should be done in the setup function below. */
}

AppAssistant.prototype.setup = function() {
	/*
	This function is for setup tasks that have to happen when the app is first created.
	This should be used to intialize any application-level data structures.
	*/
};

AppAssistant.prototype.considerForNotification = function(notificationData) {
	/*
	This function is called if all other notification commanders do not
	process a particular sendToNotification call. The assistant may perform
	any default processing here if desired.
	*/
};

AppAssistant.prototype.handleLaunch = function(params){
	/*
	This function is called after the application has launched by the user or
	the applicationManager service. This may be called while the app is already
	running.

	This function should handle any application-defined commands stored in the
	params field and launch the main stage, if necessary.
	*/

	var stageController = this.controller.getStageProxy("main");
	if (stageController) {
		// If the stage has already launched or is in the process, forward the launch
		// parameter on to the current scene for processing.
		stage.delegateToSceneAssistant("handleLaunch", params);
	}
	if (!stageController) {
		// The stage has not been created, initialize it and push the main scene after
		// initialization.
		this.controller.createStageWithCallback({
				name: "main",
				lightweight: true,
			},
			function(stageController) {
				stageController.pushScene("main", params);
			},
			Mojo.Controller.StageType.card);
	}
};

AppAssistant.prototype.cleanup = function() {
	/* this function should do any cleanup needed before the app is destroyed */
};
