const entrada = require('readline-sync');

console.log("--- PEDIDO DE MATÉRIA-PRIMA ---");

const material = entrada.question("Digite o nome do material: ");
const quantidade = entrada.questionFloat("digite a quantidade do material: ");
const valor = entrada.questionInt("Digite o valor do material: ");

const totalConta = quantidade * valor;

console.log("\n--- RESULTADO DA COMPRA ---");
console.log(`Material: ${material}`);
console.log(`Quantidade: ${quantidade}`);
console.log(`Preco do material: R$ ${totalConta.toFixed(2)}`);
console.log(`Valor total da compra: R$ ${totalConta.toFixed(2)}`);
console.log("------------------------------");