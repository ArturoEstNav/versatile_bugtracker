import { Controller } from "stimulus"

export default class extends Controller {
  play() {
    console.log(`Play!`)
  }

  pause() {
    console.log(`Pause!`)
  }

  stop() {
    console.log(`Stop!`)
  }
}
