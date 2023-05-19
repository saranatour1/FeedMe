const itemPrices = document.querySelectorAll(".item-price");
const resetBtns = document.querySelectorAll(".reset-btn");
const quantityInputs = document.querySelectorAll(".quantity");
const addItems = document.querySelectorAll(".add-items");
const total = document.getElementById("total");
const allTotal = document.getElementById("quantity-total");

// Initialize counters and values
const quantityValues = Array.from(quantityInputs).map(() => 0);

addItems.forEach((addItem, index) => {
  const quantityInput = quantityInputs[index];

  addItem.addEventListener("click", () => {
    quantityValues[index]++;
    quantityInput.value = quantityValues[index];

    calculateTotalAmount();
  });
});

resetBtns.forEach((resetBtn, index) => {
  const quantityInput = quantityInputs[index];

  resetBtn.addEventListener("click", () => {
    quantityValues[index] = 0;
    quantityInput.value = quantityValues[index];

    calculateTotalAmount();
  });
});

function calculateTotalAmount() {
  let totalAmount = 0;
  let quan = 0;

  itemPrices.forEach((elem, index) => {
    const price = parseFloat(elem.innerHTML);
    const quantity = quantityValues[index] || 0;

    const itemTotal = price * quantity;
    totalAmount += itemTotal;
    quan += quantity;
  });

  allTotal.value = quan;
  total.value = totalAmount.toFixed(2);
}

// Initial calculation
calculateTotalAmount();
