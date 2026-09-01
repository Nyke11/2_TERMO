const entrada = require('readline-sync');
let nome = entrada.question("Digite seu nome: ");
let ano_nascimento = entrada.questionFloat("Digite o ano que nasceu: ");

let idade = 2026 - ano_nascimento



if(idade <= 16){
    console.log("Você pode votar")
}

if(idade >= 15){
    console.log("Você não pode votar")
}