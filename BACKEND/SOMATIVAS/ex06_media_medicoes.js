const entrada = require('readline-sync');
let total = 0;
let media = -1; 

while (media !== 0) {
    media = entrada.questionFloat("Digite a media (ou 0 para finalizar): ");
    total += media;
}
console.log(`\nTotal soma: R$ ${total.toFixed(2)}`);
console.log(`\nSua media é: R$ ${total.toFixed(5)}`);