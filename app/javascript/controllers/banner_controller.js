import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "mobile", "laptop" ]

  adjustSize(){
    if (window.innerWidth < 992) {
      this.laptopTarget.style.display = "none"
      this.mobileTarget.style.display = "block"
    } else {
      this.mobileTarget.style.display = "none"
      this.laptopTarget.style.display = "block"
    }
  }
}
