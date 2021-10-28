var email = localStorage.getItem('email')
var senha = localStorage.getItem('passaword')


if (email != 'teste@bandtec.com.br' && senha != "1234") {
    alert('Não conectado')
    window.location.href = 'tela_cadastro.html'
}
