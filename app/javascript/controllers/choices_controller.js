// app/javascript/controllers/choices_controller.js
import { Controller } from "@hotwired/stimulus"
import Choices from "choices.js"

export default class extends Controller {
  connect() {
    new Choices(this.element, {
      //renderChoiceLimit: 5,
      searchFields: ['label'],
      searchEnabled: true,
      searchChoices: true,
      editItems: false,
      allowHTML: true,
      removeItemButton: true,
    });
  }
}