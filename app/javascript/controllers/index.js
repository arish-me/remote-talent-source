// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"


import PlacesAutocomplete from 'stimulus-places-autocomplete'

import AccessibilityController from "./accessibility_controller.js"
application.register("accessibility", AccessibilityController)

import Forms__KeyboardSubmitController from "./keyboard_submit_controller.js"
application.register("forms--keyboard-submit", Forms__KeyboardSubmitController)

import HelloController from "./hello_controller"
application.register("hello", HelloController)

import FileUploadController from "./file_upload_controller.js"
application.register("file-upload", FileUploadController)
application.register('places', PlacesAutocomplete)

import ToastController from "./toast_controller.js"
application.register("toast", ToastController)
