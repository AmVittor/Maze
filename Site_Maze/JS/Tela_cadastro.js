//validação cadastro
function transformacoes() {
  var email = in_email.value;
  var cpf = in_cnpj.value;
  var senha = in_senha.value;
  var nome = in_nome.value;
  var empresa = in_nome_emp.value;
  email = email.trim();
  cpf = cpf.trim();
  senha = senha.trim();
  nome = nome.trim();



  if (email.trim() == "") {
    alert("E-mail em branco")
  }
  else if (email.indexOf(".com") == -1) {
    alert("Email falta .com");
  } else if (email.indexOf("@") == -1) {
    alert("email em branco")

  } else if (nome == "") {
    alert("Nome em branco")
  } else if (nome.length < 3) {
    alert("Nome muito curto")
  } else if (cpf == "") {
    alert("CNPJ em branco")
  } else if (senha == "") {
    alert("senha em branco")
  } else {
    alert("Bem-vindo!");
    localStorage.setItem('email_emp', `${email}`)
    localStorage.setItem('passaword_emp', `${senha}`)
    localStorage.setItem("nome_emp", `${empresa}`)
    href("../HTML/dashboard.html")
  }

}

var email_local = 0
var senha_local = 0
//validação login
function login() {
  var email = email_login.value;
  var senha = senha_login.value;
  var empresa = empresa_login.value;
  email_local = localStorage.getItem('email_emp')
  senha_local = localStorage.getItem('passaword_emp')
  var empresa_loc = localStorage.getItem('nome_emp')
  if (email.trim() == "") {
    alert("E-mail em branco")
  }
  else if (email.indexOf(".com") == -1) {
    alert("Email falta .com");
  } else if (email.indexOf("@") == -1) {
    alert("email em branco")

  } else if (senha == "") {
    alert("Senha em branco")
  } else if (email.length < 6) {
    alert("E-mail muito curto")
  } else if (senha == "") {
    alert("Senha em branco")
  }
  else if (empresa != empresa_loc) {
    alert("empresa incorreta ou não existente")
  } 
  else if (email != email_local) {
    alert("email incorreta")
  } 
  else if (senha != senha_local) {
    alert("Senha incorreta")
  } 
  else {
    alert("Bem-vindo!");
    div_login.style.display = "none";
    linha_login.style.display = "none";
    nav_index.innerHTML = `
        <li><a href="./dashboard.html">Dashboard</a></li>
        <li><a style="margin-left: 2%;" href="./cadastro.html">${empresa_loc}</a></li>`
        
  }
  
}
