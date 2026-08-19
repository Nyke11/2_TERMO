const entrada = require('readline-sync');

const nome = entrada.question("Digite seu nome: ");
const ano_nascimento = entrada.question("Digite sua idade: ");
const ano_atual = 2026;

const idade = ano_atual - ano_nascimento;

console.log(`\nNome: ${nome}`);
console.log(`Ano de nascimento: ${idade}`);
console.log(`Idade: ${idade} anos`);

if (idade >= 18) {
    console.log("SITUACAO: PODE VOTAR! ");
} else if (idade === 16 || idade === 17) {
    console.log("SITUACAO: PODE VOTAR, MAS O VOTO NAO E OBRIGATORIO! ");
} else {
    console.log("SITUACAO: NAO PODE VOTAR! ");
}