// Import and register all your controllers from the importmap under controllers/*

import { application } from "controllers/application"

// Eager load all controllers defined in the import map under controllers/**/*_controller
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
eagerLoadControllersFrom("controllers", application)

// Lazy load controllers as they appear in the DOM (remember not to preload controllers in import map!)
// import { lazyLoadControllersFrom } from "@hotwired/stimulus-loading"
// lazyLoadControllersFrom("controllers", application)

// import TrixYoutubePluginController from "./trix_youtube_plugin_controller.js"
// application.register("trix-youtube-plugin", TrixYoutubePluginController)

// import NewTabController from "./new_tab_controller"
// application.register("new-tab", NewTabController)