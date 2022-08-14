import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["block", "question", "icon", "answer"]

  itemHeight = this.answerTarget.scrollHeight

  connect() {
    console.log(this.questionTargets);
  }

  // const allCross = this.questionTarget
  // const = this.answerTarget

  open() {
          if (this.iconTarget.classList.contains('fa-plus')){
            this.iconTarget.classList.remove('fa-plus')
            this.iconTarget.classList.add('fa-minus')
            this.answerTarget.classList.remove('d-none')
          } else {
            this.iconTarget.classList.remove('fa-minus')
            this.iconTarget.classList.add('fa-plus')
            this.answerTarget.classList.add('d-none')
          }

      // }
  }
}
