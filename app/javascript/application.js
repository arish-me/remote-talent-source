// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import * as bootstrap from "bootstrap"
import "trix"
import "@rails/actiontext"

window.initAutocomplete = function () {
  const event = new Event('google-maps-callback', {
    bubbles: true,
    cancelable: true,
  })
  window.dispatchEvent(event)
}


window.addEventListener("trix-file-accept", function(event) {
  event.preventDefault()
  alert("File attachment not supported!")
})