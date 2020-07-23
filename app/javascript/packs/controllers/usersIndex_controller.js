import { Controller } from "stimulus"

export default class extends Controller {

    open_href(event){
       console.log(event.currentTarget); 
       window.open(event.currentTarget.dataset.href, "_self");
    }
}