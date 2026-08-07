import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["display", "minutesInput"]

  connect() {
    this.totalSeconds = 30 * 60
    this.remainingSeconds = this.totalSeconds
    this.timer = null
    this.endTime = null

    this.updateDisplay()
  }

  setPreset(event) {
    const minutes = parseInt(
      event.currentTarget.dataset.minutes,
      10
    )

    if (minutes > 0) {
      this.setTimeInMinutes(minutes)
    }
  }

  setCustomTime() {
    const minutes = parseInt(
      this.minutesInputTarget.value,
      10
    )

    if (minutes > 0) {
      this.setTimeInMinutes(minutes)
    }
  }

  setTimeInMinutes(minutes) {
    this.pause()

    this.totalSeconds = minutes * 60
    this.remainingSeconds = this.totalSeconds
    this.endTime = null

    this.updateDisplay()
  }

  start() {
    if (this.timer || this.remainingSeconds <= 0) return

    this.endTime =
      Date.now() + this.remainingSeconds * 1000

    this.timer = setInterval(() => {
      this.updateRemainingTime()
    }, 250)

    this.updateRemainingTime()
  }

  updateRemainingTime() {
    const remaining = Math.max(
      0,
      Math.ceil((this.endTime - Date.now()) / 1000)
    )

    this.remainingSeconds = remaining
    this.updateDisplay()

    if (remaining <= 0) {
      this.finish()
    }
  }

  pause() {
    if (this.timer) {
      clearInterval(this.timer)
      this.timer = null
    }

    if (this.endTime) {
      this.remainingSeconds = Math.max(
        0,
        Math.ceil((this.endTime - Date.now()) / 1000)
      )
    }

    this.endTime = null
    this.updateDisplay()
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

  playAlert() {
    const context = new (
      window.AudioContext ||
      window.webkitAudioContext
    )()

    const beeps = [0, 0.6, 1.2]

    beeps.forEach((offset) => {
      const oscillator = context.createOscillator()
      const gain = context.createGain()

      oscillator.connect(gain)
      gain.connect(context.destination)

      oscillator.type = "sine"
      oscillator.frequency.value = 880

      const startTime = context.currentTime + offset
      const endTime = startTime + 0.4

      gain.gain.setValueAtTime(0.4, startTime)

      gain.gain.exponentialRampToValueAtTime(
        0.001,
        endTime
      )

      oscillator.start(startTime)
      oscillator.stop(endTime)
    })
  }

  updateDisplay() {
    const mins = String(
      Math.floor(this.remainingSeconds / 60)
    ).padStart(2, "0")

    const secs = String(
      this.remainingSeconds % 60
    ).padStart(2, "0")

    this.displayTarget.textContent = `${mins}:${secs}`
  }

  disconnect() {
    this.pause()
  }
}