  import { Controller } from "stimulus"

  export default class extends Controller {
    static targets = [ "tickets", "history", "ticketsToggle", "historyToggle" ]

    indicator() {
      console.log(this.navbarTarget)
    }
  }
