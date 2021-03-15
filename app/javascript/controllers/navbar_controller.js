import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "tickets", "history", "ticketsToggle", "historyToggle" ]

  setDisplay() {
    // unset previous display
    this.ticketsToggleTarget.classList.remove("navbar-selected-item");
    this.historyToggleTarget.classList.remove("navbar-selected-item");
    this.ticketsToggleTarget.classList.add("navbar-show-item");
    this.historyToggleTarget.classList.add("navbar-show-item");
    this.ticketsTarget.style.display = 'none';
    this.historyTarget.style.display = 'none';
    // sort and set new display
    let section = event.explicitOriginalTarget.dataset.navbarTarget
      if(section == "ticketsToggle") {
        console.log('tickets')
        this.ticketsToggleTarget.classList.remove("navbar-show-item");
        this.ticketsToggleTarget.classList.add("navbar-selected-item");
        this.ticketsTarget.style.display = 'block';
      } else {
        this.historyToggleTarget.classList.remove("navbar-show-item");
        this.historyToggleTarget.classList.add("navbar-selected-item");
        this.historyTarget.style.display = 'block';
      }
   }
}
