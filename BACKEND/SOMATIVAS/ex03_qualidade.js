const entrada = require('readline-sync');

console.log("-----------------------");
console.log("   SISTEMAS DE PEÇAS   ");
console.log("---------------------\n");

const peso = entrada.question("Digite o peso da peca: ");

console.log(`\npeso: ${peso}`);

if (peso >= 95 && peso <= 105) {
    console.log("PEÇA APROVADA ✅");
} 
else{
    console.log("PEÇA REPROVADA ❌");
} 
console.log("Peso Informado:" + peso + "g")
console.log("-------------------------------------");