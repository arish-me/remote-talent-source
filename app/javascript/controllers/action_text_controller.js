import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static UNUSED_TOOLBAR_CLASSES = [
    ".trix-button--icon-strike",
    ".trix-button--icon-link",
    ".trix-button-group--block-tools",
    ".trix-button-group--file-tools",
    ".trix-button-group--history-tools"
  ];

  connect() {
    // Wait for the trix editor is attached to the DOM to do stuff
    addEventListener("trix-initialize", (event) => {
      this.constructor.UNUSED_TOOLBAR_CLASSES.forEach((cls) => {
        document.querySelector(cls)?.remove();
      });
    }, true);

    // Remove file upload handling
    addEventListener("trix-file-accept", (event) => {
      event.preventDefault();
    }, true);
  }
}
