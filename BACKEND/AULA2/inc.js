const entrada = require('readline-sync');

console.log("--- SISTEMA DE CALCULO DE IMC ---");

const numeroPeso = entrada.question("Digite seu peso? ");
const numeroAltura = entrada.questionFloat("Digite sua altura: ");

const calculo = numeroPeso / (numeroAltura **2)

console.log("\n--- RESULTADO IMC ---");
console.log(`Seu IMC é: R$ ${calculo.toFixed(2)}`);