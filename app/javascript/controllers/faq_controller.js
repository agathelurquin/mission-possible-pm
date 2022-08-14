import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["block", "question", "icon", "answer"]


  connect() {
    console.log(this.questionTargets);
  }

  // const allCross = this.questionTarget
  // const = this.answerTarget

  open() {
    // itemHeight = this.answerTarget.scrollHeight
    this.blockTargets.forEach(block => {
      if (this.iconTarget.classList.contains('fa-plus')){
        this.iconTarget.classList.remove('fa-plus')
        this.iconTarget.classList.add('fa-minus')
        this.answerTarget.classList.remove('d-none')
      } else {
        this.iconTarget.classList.remove('fa-minus')
        this.iconTarget.classList.add('fa-plus')
        this.answerTarget.classList.add('d-none')
      }
    });
  }

  // open() {
  //   this.iconTargets.forEach(icon => {
  //     icon.addEventListener('click', function(){
  //       if (this.iconTarget.classList.contains('fa-plus')){
  //       block.this.iconTarget.classList.remove('fa-plus')
  //       block.this.iconTarget.classList.add('fa-minus')
  //       } else {
  //       block.this.iconTarget.classList.remove('fa-minus')
  //       block.this.iconTarget.classList.add('fa-plus')
  //       }
  //     })

  //   });
  // }
}
