import Rails from 'rails-ujs'
import Flatpickr from 'stimulus-flatpickr'

export default class extends Flatpickr {
  static targets = [ "button"]

  connect() {
    console.log(this.price)
    this.config = {
      altInput: true,
      altFormat: 'd-m-Y',
      showMonths: 1,
      mode: 'multiple'
    }

    super.connect();
  }

  monthChange() {
    this.fetchDates()
  }

  yearChange() {
    this.fetchDates()
  }

  change(selectedDates) {
    if (selectedDates.length > 0) {
      this.buttonTarget.disabled = false;
    } else {
      this.buttonTarget.disabled = true;
    }
  }

  fetchDates() {
    const month = this.fp.currentMonth
    const year = this.fp.currentYear

    fetch(`${this.url}?month=${month}&year=${year}`, {
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': Rails.csrfToken()
      },
      credentials: 'same-origin'
    })
     .then((response) => {
      if (response.status === 200) {
        return response.json()
      } else {
        return false
      }
    })
     .then((data) => {
      if (data) {
        this.fp.set('enable', data)
      }
     })
  }

  get url() {
    if (this.data.has('url')) {
      return this.data.get('url')
    } else {
      return null;
    }
  }

  get price() {
    return this.data.has('price') ? this.data.get('price') : 0
  }
}
