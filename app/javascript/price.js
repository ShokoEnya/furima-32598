window.addEventListener("load", () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price")
    const profitAmount = document.getElementById("profit")
    const taxRate = 0.1
    addTaxDom.innerHTML = Math.floor( inputValue * taxRate )
    profitAmount.innerHTML = Math.floor( inputValue - addTaxDom.innerHTML )
  })

})