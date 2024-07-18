import { Controller } from "@hotwired/stimulus"
//import { Modal } from "tailwindcss-stimulus-components"
export default class extends Controller {
  static targets = ["modal", "editButton"]

  connect() {
    this.hideEditIcon()
  }

  showEditIcon() {
    this.editButtonTarget.classList.remove('hidden')
  }

  hideEditIcon() {
    this.editButtonTarget.classList.add('hidden')
  }

  openEditModal() {
    this.modalTarget.classList.remove('hidden')
  }

  closeEditModal() {
    this.modalTarget.classList.add('hidden')
  }
}
