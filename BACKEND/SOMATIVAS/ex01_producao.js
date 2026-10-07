const entrada = require('readline-sync');

console.log("-------------------");
console.log("  PRODUÇÃO DO TURNO");
console.log("-------------------\n");

let pecasProduzidas = 120;
let horasTurno = 8;

const producaoTotal = pecasProduzidas / horasTurno;

console.log("Producao por hora:" + producaoTotal + "pecas");
console.log("Horas do turno: " + horasTurno + "horas");
console.log("Producao total do turno:" + pecasProduzidas + "pecas");