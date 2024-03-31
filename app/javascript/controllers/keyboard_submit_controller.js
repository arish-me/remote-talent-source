import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["submit"];

  connect() {
    this.originalLabel = this.submitTarget.value;
  }

  submit() {
    this.submitTarget.disabled = true;
    this.submitTarget.innerHTML = "<i class='fas fa-spinner fa-spin'></i> Processing...";
  }
}
