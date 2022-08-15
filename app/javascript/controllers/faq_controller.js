import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["block", "question", "icon", "answer"]

  connect() {
    console.log(document.getElementById('answer1'));
  }

  // const allCross = this.questionTarget
  // const = this.answerTarget

  open() {
    this.blockTargets.forEach(block => {
      if (this.iconTarget.classList.contains('fa-plus')){
        this.iconTarget.classList.remove('fa-plus')
        this.iconTarget.classList.add('fa-minus')
        this.answerTarget.classList.remove('zero-height', 'zero-opacity')
        this.answerTarget.classList.add('norm-height', 'norm-opacity')
        // document.getElementById('answer1').style.height = "100px"
        // document.getElementById('answer1').style.opacity = "0.9"
      } else {
        this.iconTarget.classList.remove('fa-minus')
        this.iconTarget.classList.add('fa-plus')
        this.answerTarget.classList.remove('norm-height', 'norm-opacity')
        this.answerTarget.classList.add('zero-height', 'zero-opacity')

        // document.getElementById('answer1').style.height = "0px"
        // document.getElementById('answer1').style.opacity = "0"
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
