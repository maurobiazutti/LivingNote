import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["display", "minutesInput"]

  connect() {
    this.totalSeconds = 30 * 60 // Padrão: 30 minutos
    this.remainingSeconds = this.totalSeconds
    this.timer = null
    this.updateDisplay()
  }

  // Define um tempo rápido via botões (ex: 25 min, 5 min)
  setPreset(event) {
    const minutes = parseInt(event.currentTarget.dataset.minutes)
    this.setTimeInMinutes(minutes)
  }

  // Define um tempo personalizado vindo de um campo de texto/número
  setCustomTime() {
    const minutes = parseInt(this.minutesInputTarget.value)
    if (minutes && minutes > 0) {
      this.setTimeInMinutes(minutes)
    }
  }

  setTimeInMinutes(minutes) {
    this.pause()
    this.totalSeconds = minutes * 60
    this.remainingSeconds = this.totalSeconds
    this.updateDisplay()
  }

  start() {
    if (this.timer) return

    this.timer = setInterval(() => {
      if (this.remainingSeconds > 0) {
        this.remainingSeconds--
        this.updateDisplay()
      } else {
        this.finish()
      }
    }, 1000)
  }

  pause() {
    clearInterval(this.timer)
    this.timer = null
  }

  reset() {
    this.pause()
    this.remainingSeconds = this.totalSeconds
    this.updateDisplay()
  }

  finish() {
    this.pause()
    this.playAlert()
    alert("⏰ Tempo esgotado!")
  }

  // Toca um bipe de alerta quando o tempo acaba (Web Audio API, sem arquivos)
  playAlert() {
    const context = new (window.AudioContext || window.webkitAudioContext)()
    const beeps = [0, 0.6, 1.2]

    beeps.forEach((offset) => {
      const osc = context.createOscillator()
      const gain = context.createGain()
      osc.connect(gain)
      gain.connect(context.destination)
      osc.type = 'sine'
      osc.frequency.value = 880

      gain.gain.setValueAtTime(0.4, context.currentTime + offset)
      gain.gain.exponentialRampToValueAtTime(0.001, context.currentTime + offset + 0.4)
      osc.start(context.currentTime + offset)
      osc.stop(context.currentTime + offset + 0.4)
    })
  }

  updateDisplay() {
    const mins = String(Math.floor(this.remainingSeconds / 60)).padStart(2, '0')
    const secs = String(this.remainingSeconds % 60).padStart(2, '0')
    this.displayTarget.textContent = `${mins}:${secs}`
  }

  disconnect() {
    this.pause()
  }
}