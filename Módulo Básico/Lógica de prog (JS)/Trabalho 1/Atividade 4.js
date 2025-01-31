/*(4) A padaria Hotpão vende uma certa quantidade de pães franceses e uma quantidade de broas a
cada dia. Cada pãozinho custa R$ 0,12 e a broa custa R$ 1,50. Ao final do dia, o dono quer saber
quanto arrecadou com a venda dos pães e broas (juntos), e quanto deve guardar numa conta de
poupança (10% do total arrecadado). Você foi contratado para fazer os cálculos para o dono. Com
base nestes fatos, faça um algoritmo para ler as quantidades de pães e de broas, e depois calcular
os dados solicitados.
*/

//Declaração de constantes
const VALORPAO=0.12, VALORBROA=1.50;

//Declaração de variáveis e inputs
var qntPaozinho = prompt("Informe o número de pãeszinhos vendidos: ");
var qntBroa = prompt("Informe o numero de broas vendidas: ");
var poupanca = (qntPaozinho*VALORPAO + qntBroa*VALORBROA)*0.1;

//outputs
console.log("\nO valor arrecadado em pãeszinhos é: R$ " + (qntPaozinho*VALORPAO).toFixed(2));
console.log("\nO valor arrecadado em broas é: R$ " + (qntBroa*VALORBROA).toFixed(2));
console.log("\nO valor total arrecadado é: R$ " + ((qntPaozinho*VALORPAO) +(qntBroa*VALORBROA)).toFixed(2));
console.log("\nO valor que deve ser colocado na poupança é: R$ "+poupanca.toFixed(2));