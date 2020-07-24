import { Controller } from "stimulus"

export default class extends Controller {
    static targets = ["output"]

    readURL(event) {
        var input = event.currentTarget;
        var output = this.outputTarget;
    
        if (input.files && input.files[0]) {
            var reader = new FileReader();
    
            reader.onload = function () {
                output.src = reader.result
            }
    
            reader.readAsDataURL(input.files[0]);
        }
    }
}