const fs = require('fs');

console.log("=== SISTEMA DE PERSISTENCIA: LEITURA DE MÁQUINAS ===");

const nomeDoArquivo = "maquinas.json";

if (!fs.existsSync(nomeDoArquivo)) {
    console.error(`Erro: o arquivo '${nomeDoArquivo}' nao foi encontrado`);
};

const conteudoTexto = fs.readFileSync(nomeDoArquivo, 'utf-8');

const maquinasRecuperadas = JSON.parse(conteudoTexto);

function buscarPorId(maquinas, id) {
    return maquinas.find((maquina) => maquina.id === id);
}

function filtrarPorStatus(maquinas, status) {
    return maquinas.filter((maquina) => maquina.status === status);
}

console.log("Dados carregados com sucesso:\n");
console.table(maquinasRecuperadas);

console.log(`\nTotal de máquinas cadastradas: ${maquinasRecuperadas.length}`);
console.log(`Primeira máquina da lista: ${maquinasRecuperadas[0].nome}`);

function executar() {
    console.log(`\n=== Busca pelo ID 3 ===`);
    console.table(buscarPorId(maquinasRecuperadas, 3) ?? 'Maquina não encontrada');
    console.log(`\n=== MAQUINAS EM MANUTENAO ===`);
    console.table(filtrarPorStatus(maquinasRecuperadas, 'manutencao'));
}
executar();