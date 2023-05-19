const itemPrices = document.querySelectorAll(".item-price");
const resetBtns = document.querySelectorAll(".reset-btn");
const quantityInputs = document.querySelectorAll(".quantity");
const addItems = document.querySelectorAll(".add-items");
const total = document.getElementById("total");

// Initialize counter
let counter = 0;
const quantityValues = [];

addItems.forEach((addItem, index) => {
  const quantityInput = quantityInputs[index];

  addItem.addEventListener("click", () => {
    counter++;
    quantityInput.value = counter;
    quantityValues[index] = counter;

    calculateTotalAmount();
  });
});

resetBtns.forEach((resetBtn, index) => {
  const quantityInput = quantityInputs[index];

  resetBtn.addEventListener("click", () => {
    counter = 0;
    quantityInput.value = counter;
    quantityValues[index] = counter;

    calculateTotalAmount();
  });
});

let index = 0;
let totalAmount = 0;

function calculateTotalAmount() {
  totalAmount = 0;

  itemPrices.forEach((elem, index) => {
    const price = parseFloat(elem.innerHTML);
    const quantity = quantityValues[index] || 0;

    const itemTotal = price * quantity;
    totalAmount += itemTotal;
  });

  total.value = totalAmount;
  console.log(total);
}

// Initial calculation
calculateTotalAmount();
