const entrada = require('readline-sync')

// Criando a " ferramenta" da conversão
function converterParaFahrenheit(celsius) {
    let Fahrenheit = (celsius * 9/5) + 32;
    return Fahrenheit; // Devolve o resultado para quem chamou
}

const tempC = entrada.questionFloat("Digite a temperatura em Celsius: ");

// Chamado a função e guardando o que ela "cuspiu" de volta
const tempF = converterParaFahrenheit(tempC);
console.log(`A temperatura convertida e: ${tempF.toFixed(1)}°F`);