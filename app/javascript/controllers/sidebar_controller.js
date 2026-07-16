import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "container" ]

  toggle() {
    // Detecta se o usuário está no celular/tablet (largura menor que 768px, que é o 'md' do Tailwind)
    const isMobile = window.innerWidth < 768

    if (isMobile) {
      // No Mobile: Apenas desliza para dentro/fora da tela
      this.containerTarget.classList.toggle("-translate-x-full")
    } else {
      // No Desktop: Alterna entre a largura cheia (w-64) e o modo ícones (w-20)
      this.containerTarget.classList.toggle("md:w-64")
      this.containerTarget.classList.toggle("md:w-20")
      this.containerTarget.classList.toggle("sidebar-collapsed")
    }
  }
}