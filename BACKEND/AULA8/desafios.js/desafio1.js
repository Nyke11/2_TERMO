const entrada = require("readline-sync");

console.log("---------------------------------");
console.log("CONTROLE DE ACESSO AO LABORATÓRIO");
console.log("---------------------------------\n");

const idade = entrada.questionInt("Digite a idade do aluno: ");

const autorizacao = entrada.question("Possui autorizacao? (S/N):").toUpperCase();

const autorizacao = entrada.question("Esta acompanhado por um professor? (S/N):").toUpperCase();

if (
 (idade >= 16  autorizacao === "S") {
    console.log(" ACESSO LIBERADO ✔️");
  }

else if (idade >= 11 && idade <= 15) {
    console.log("ACESSO NEGADO ❌");
}