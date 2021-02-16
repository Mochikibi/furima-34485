window.addEventListener('load', () => {
const priceInput = document.getElementById("item-price");
priceInput.addEventListener("input", () => {
  const inputPrice = priceInput.value; 
  const addTax = document.getElementById("add-tax-price")
  const Tax = 0.1
  addTax.innerHTML = Math.floor(inputPrice * Tax);
  const profit = document.getElementById("profit");
  profit.innerHTML = inputPrice - (inputPrice * Tax);
});
});
