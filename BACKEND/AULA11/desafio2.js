const entrada = require('readline-sync');
let valor = entrada.question("Digite o valor da compra: ");

let idade = 0.10 * valor

if(idade <= 100){
    console.log("Você teve desconto")
}

if(idade >= 80){
    console.log("Você não teve desconto")
}