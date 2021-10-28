var email_local = localStorage.getItem('email_emp')
var senha_local = localStorage.getItem('passaword_emp')


if (email_local == ' ' && senha_local == ' ') {
    alert('Não conectado')
    window.location.href = 'cadastro.html'
}
