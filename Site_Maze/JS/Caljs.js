//validação Sobre nós
function enviar_msg() {
    var email = emailid.value;
    var mensagem = opnion.value;
    var nome = nomeid.value;
    email = email.trim();
    mensagem = mensagem.trim();
    nome = nome.trim();

        if (email.trim() == "") {
            alert("E-mail em branco")
        } else if (email.indexOf(".com") == -1) {
            alert("Email falta .com");
        } else if (email.indexOf("@") == -1) {
            alert("email em branco")
        } else if (nome == "") {
            alert("Nome em branco")
        } else if (nome.length < 3) {
            alert("Nome muito curto")
        } else if (mensagem == "") {
            alert("Mensagem em branco")
        } else {
            alert("Mensagem enviada");
        }
    }

// localStorage.setItem('email', 'teste@bandtec.com.br')
// localStorage.setItem('passaword', 1234)
var email = localStorage.getItem('email')
var senha = localStorage.getItem('passaword')
if (email != 'teste@bandtec.com.br' && senha != "1234") {
    alert('Não conectado')
    window.location.href = 'tela_cadastro.html'
}

var linha_selecionada;
var plano;
var preco;

//Cálculo principal
function fnCalculo() {
    linha_selecionada = linha.value;
    plano = selecao.value;
    preco = input_preco.value;
    //Guardando em uma váriavel a quantidade de pessoas de acordo com a linha selecionada
    var qtd_pessoas = fnQtdPessoas(linha_selecionada);
    var visualizacoes_por_dia = qtd_pessoas;
    //Cálculo da quantidade de pessoas por mês
    var visualizacoes_mensais = (visualizacoes_por_dia * 30).toLocaleString();
    //Resultado financeiro
    var resultado_financeiro = (preco * qtd_pessoas * 0.01).toLocaleString();
    //Mostrar o retorno financeiro e as visualizações
    tempo.innerHTML = `Selecionando o plano <strong style="color: white">${plano}</strong>, na linha <strong style="color: white">${linha_selecionada}</strong>, seu anúncio terá aproximadamente: <br><br>
         <strong id="views_dia" style="color: white">${visualizacoes_por_dia}</strong> visualizações por dia,<br>
         <strong id="views_mes" style="color: white">${visualizacoes_mensais}</strong> visualizações por mês e,<br><br>
         <strong id="resultado_financeiro" style="color: white">R$${resultado_financeiro}</strong> de retorno financeiro, aproximadamente.   
         `;

    function fnQtdPessoas(linha) {
        if (linha == "1") {
            return 489000;
        } else if (linha == "2") {
            return 275000;
        } else if (linha == "3") {
            return 603000;
        } else if (linha == "4") {
            return 350000;
        } else if (linha == "5") {
            return 87900;
        } else if (linha == "15") {
            return 43000;
        }
    }
}