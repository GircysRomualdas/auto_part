import { Controller } from "@hotwired/stimulus"
import { post } from "@rails/request.js"

// Connects to data-controller="stripe-checkout"
export default class extends Controller {
  static values = { publishableKey: String, url: String };
  
  async connect() {
    const stripe = Stripe(this.publishableKeyValue);

    // Make sure we only initialize checkout once
    if (this.checkout) {
      return;
    }

    const response = await post(this.urlValue);
    const { clientSecret } = await response.json();

    this.checkout = await stripe.initEmbeddedCheckout({
      clientSecret,
    });

    this.checkout.mount(this.element);
  }
}

