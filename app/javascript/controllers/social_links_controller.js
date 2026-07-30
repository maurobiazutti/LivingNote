import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["container", "template"]

  connect() {
    this._index = Date.now()
  }

  add(event) {
    event.preventDefault()

    this._index += 1
    const content = this.templateTarget.innerHTML.replaceAll("NEW_RECORD", this._index)
    this.containerTarget.insertAdjacentHTML("beforeend", content)
  }

  remove(event) {
    event.preventDefault()
    const item = event.currentTarget.closest("[data-social-links-target='item']")
    if (!item) return

    const destroyInput = item.querySelector("input[name*='[_destroy]']")
    if (destroyInput) {
      destroyInput.value = "1"
      item.classList.add("hidden")
    } else {
      item.remove()
    }
  }
}
