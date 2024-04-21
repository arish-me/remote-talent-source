import { Controller } from "@hotwired/stimulus"
import { Turbo } from "@hotwired/turbo-rails"

export default class extends Controller {
  static targets = ["openRoles", "skills"];

  onChange() {
    const selectedRoles = Array.from(this.openRolesTarget.selectedOptions).map(option => option.value);
    //Turbo.visit(`/skills?selected_roles=${selectedRoles.join(",")}`);
    const skillsFrame = document.getElementById("skills-frame");
    if (skillsFrame) {
      skillsFrame.src = `/skills?selected_roles=${selectedRoles.join(",")}`;
    }
  }
}
