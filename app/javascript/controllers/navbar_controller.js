import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "tickets", "history", "ticketsToggle", "historyToggle" ]

  connect() {
    console.log("navbar")
  }
}
