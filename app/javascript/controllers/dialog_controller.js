import Dialog from '@stimulus-components/dialog';
import 'bootstrap';

export default class extends Dialog {
  connect() {
    super.connect();
    console.log('Do what you want here.');
  }

  open() {
    const modal = new bootstrap.Modal(this.element);
    modal.show();
  }

  close() {
    const modal = bootstrap.Modal.getInstance(this.element);
    if (modal) {
      modal.hide();
    }
  }
}
