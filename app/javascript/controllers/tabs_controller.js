import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["nav", "panel"]

  connect() {
    this._apply(this.data.get("initial") || (this.navTarget.querySelector("[data-tab]")?.dataset.tab))
  }

  select(event) {
    this._apply(event.currentTarget.dataset.tab)
  }

  _apply(name) {
    this.navTarget.querySelectorAll("[data-tab]").forEach((button) => {
      const active = button.dataset.tab === name
      button.classList.toggle("hidden", false)
      const cls = active ? button.dataset.active : button.dataset.inactive
      button.className = `tab-btn px-4 py-2.5 rounded-xl text-sm font-semibold transition border border-transparent ${cls}`
    })

    this.panelTargets.forEach((panel) => {
      panel.classList.toggle("hidden", panel.dataset.panel !== name)
    })
  }
}