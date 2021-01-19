import { Component, NgModule } from "@angular/core";
import { BrowserModule } from "@angular/platform-browser";
import { FormsModule } from "@angular/forms";

@Component({
  selector: 'customer-search',
  template: '\
        <header> \
          <h1 class="h2">Customer Search</h1> \
        </header> \
        <section class="search-form"> \
          <form> \
            <div class="input-group mb-3"> \
              <label for="keywords" class="sr-only">Keywords></label> \
              <input type="text" id="keywords" name="keywords" \
                     placeholder="First Name, Last Name, or Email Address"\
                     class="form-control input">\
              <span class="input-group-btn"> \
                <input type="submit" value="Find Customers"\
                       class="btn btn-primary">\
              </span> \
            </div> \
          </form> \
        </section> \
        <section class="search-results"> \
          <header> \
            <h1 class="h3">Results</h1> \
          </header> \
          <ol class="list-group"> \
            <li class="list-group-item clearfix"> \
              <h3 class="float-right"> \
                <small class="text-uppercase">Joined</small> \
                2016-01-01\
              </h3> \
              <h2 class="h3"> \
                Pat Smith\
                <small>psmith34</small> \
              </h2> \
              <h4>pat.smith@example.com</h4> \
            </li> \
          </ol> \
        </section>'
})
export class CustomerSearchComponent {}