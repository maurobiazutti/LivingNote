import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  close(event) {
    if (event) event.preventDefault()
    this.element.remove()
  }

  stopPropagation(event) {
    event.stopPropagation()
  }

  backdropClose(event) {
    if (event.target === this.element) this.close()
  }
}