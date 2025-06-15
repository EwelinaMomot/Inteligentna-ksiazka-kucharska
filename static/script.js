
class SliderSkladnikow {
  constructor(options) {
    this.step = options.step;

    this.skladniki = document.querySelectorAll(options.skladnikSelector);
    this.total = this.skladniki.length;

    this.prevBtn = document.getElementById(options.prevBtnId);
    this.nextBtn = document.getElementById(options.nextBtnId);

    this.currentIndex = 0;
    this.init();
  }

  init() {
    if (this.total <= this.step) {

      this.prevBtn.style.display = 'none';
      this.nextBtn.style.display = 'none';
    } else {

      this.show(this.currentIndex);

      this.prevBtn.addEventListener('click', () => this.prev()); 
      this.nextBtn.addEventListener('click', () => this.next()); 
    }
  }


  show(start) {
    this.skladniki.forEach((div, i) => {

      div.style.display = (i >= start && i < start + this.step) ? 'block' : 'none';
    });


    this.prevBtn.style.display = (start === 0) ? 'none' : 'inline-block';
    this.nextBtn.style.display = (start + this.step >= this.total) ? 'none' : 'inline-block';
  }


  prev() {
    this.currentIndex = Math.max(this.currentIndex - this.step, 0);
    this.show(this.currentIndex);
  }


  next() {
    if (this.currentIndex + this.step < this.total) {
      this.currentIndex += this.step;
      this.show(this.currentIndex);
    }
  }


  static toggleOpis(id, btn) {
    const div = document.getElementById(id);
    if (div.style.display === "none") {
      div.style.display = "block";
      btn.textContent = "Schowaj przepis";
    } else {
      div.style.display = "none";
      btn.textContent = "Pokaż przepis";
    }
  }

  
}


document.addEventListener('DOMContentLoaded', () => {
  new SliderSkladnikow({ 
    step: 3, 
    skladnikSelector: '.skladnik', 
    prevBtnId: 'prev', 
    nextBtnId: 'next' 
  });
});

// *** Funkcje popupu***

function openModal(text) {
  const modal = document.getElementById('modal');
  const modalText = document.getElementById('modal-text');
  modalText.innerHTML = text;
  modal.style.display = 'block';
}


function closeModal() {
  document.getElementById('modal').style.display = 'none';
}

// Zamknięcie modala po kliknięciu poza oknem
window.onclick = function(event) {
  const modal = document.getElementById('modal');
  if (event.target === modal) {
    closeModal();
  }
}