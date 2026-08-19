const entrada = require('readline-sync');

console.log("------------------------------------------");
console.log(" === SISTEMA DE CONTROLE DE QUALIDADE === ");
console.log("------------------------------------------");

const quantidadePeca = Number(readline.question("Quantas peca deseja avaliar? "));
const pesos = [];
let somaTotal = 0;

for (let i= 0; i < quantidade; i++){
    readline.question(`Digite o peso da peca: ${i=1}:`);
    pesos.push (peso);
    somaTotal += peso;
}
const media = somaTotal / peso.length;

console.log("\n--- RELATÓRIO DA AUDITORIA ---");
console.log(`Peso registrado: ${peso.join(" KG | ")} KG`);

console.log(`Quantidade de pecas: ${peso.length}`);
console.log(`Media de lote: ${media.toFixed[2] + "KG" }`);

if (media >= 4.8 && media <= 5.2){console.log(" STATUS: LOTE APROVADO!")}

else {
   console.log("STATUS FINAL: LOTE REPROVADO!")
}
