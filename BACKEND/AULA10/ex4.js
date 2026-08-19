const entrada = require("readline-sync");

console.log("=== REGISTRO DE TEMPERATURAS ===");

const temperaturas = [];

const quantidade = entrada.questionInt("Quantas temperaturas deseja registrar? ");

for (let i= 0; i < quantidade; i++){
    let temperatura = entrada.questionFloat(`Temperatura ${i+1}: `);
    temperaturas.push(temperatura);
}
console.log("\n--- RELATÓRIO ---");
console.log(`Temperatura registradas: ${temperaturas.join(" °C | ")} °C`);

console.log(`Quantidade de registros: ${temperaturas.length}`);
console.log(`Primeiro registro: ${temperaturas[0]}°C`);
console.log(`Último registro: ${temperaturas[temperaturas.length -1]}°C`);