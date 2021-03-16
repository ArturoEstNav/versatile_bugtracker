import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "sign", "button" ]

  toggleIcons() {
    if(this.signTarget.innerText.toLowerCase() == "active"){
      console.log('active')
    } else{
      console.log('not active')
      // console.log(event.explicitOriginalTarget.innerText)
    }
  }
}
