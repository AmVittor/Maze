//validação cadastro
function transformacoes() {
  var email = in_email.value;
  var cpf = in_cpf.value;
  var senha = in_senha.value;
  var nome = in_senha.value;

  email = email.trim();
  cpf = cpf.trim();
  senha = senha.trim();
  nome = nome.trim();

  if (email.indexOf("@") > -1) {
    if (email.indexOf(".com") > -1) {
      alert("Email válido");
    } else {
      alert("Email inválido");
    }
  } else {
    alert("Email inválido");
  } if (email == "") {
    alert("email em branco")
  } else {
    alert("email válido");
  } if (cpf == "") {
    alert("cpf em branco")
  } else {
    alert("cpf válido");
  } if (nome == "") {
    alert("nome inválido")
  } else {
    alert("nome válido");
  } if (senha == "") {
    alert("senha em branco")
  } else {
    alert("senha válido");
  }
}

//validação login
function transformacoeslogin() {
  var email = in_email_login.value;
  var senha = in_senha_login.value;
  email = in_email_login.trim();
  senha = in_senha_login.trim();

  if (email.indexOf("@") > -1) {
    if (email.indexOf(".com") > -1) {
      alert("Email válido");
    } else {
      alert("Email inválido");
    }
  } else {
    alert("Email inválido");
  } if (email == "") {
    alert("email em branco")
  } else {
    alert("email válido");
  } if (senha == "") {
    alert("senha inválido")
  } else {
    alert("senha válido");
  }
}


/* function cadastrar() {
  div_cadastro.style.width = '540px'
  div_login.style.width = '360px'
  div_cadastro.innerHTML = `
    <h2 id="CadastroEscuro">Cadastre sua Conta</h2>

    <div class="inputs"><span id="texto">
        <h4 id="LadoEscuro">Texto</h4>
        <input type="text" class="inpute" placeholder="texto" id='email_inp'>
    </div>

    <div class="inputs"><span id="texto">
        <h4 id="LadoEscuro">Texto</h4>
        <input type="text" class="inpute" placeholder="texto    " id='senha_inp'>
    </div>
    <div class="login">
      <button id="cadastrar">Cadastrar</button>
    </div>  `

  div_login.innerHTML = `

    <h1 style='color:black'>Olá, seja bem vindo!</h1>
    <h3 style='color:black'>Já tenho um conta!</h3>

    <div class="login">
    <button id="cadastrar" onclick='voltarLogin()'>Entrar</button>
    </div>
    `

}
localStorage.setItem('email', 'teste@bandtec.com.br')
localStorage.setItem('passaword', 1234)
var email = localStorage.getItem('email')
var senha = localStorage.getItem('passaword')
function login() {

  var email_ip = email_inp.value
  var senha_ip = senha_inp.value
  if (email == email_ip) {
    if (senha == senha_ip) {
      alert('logado com sucesso')
      window.location.href = `index.html`;
    }
    else {
      alert('Senha incorreta!')
    }
  }
  else {
    alert('Email ou senha inválido!')
  }

}
function calculadora() {
  window.location.href = `calculadora.html`;
}
function linhas() {
  window.location.href = `index.html`;
}
function voltarLogin() {
  div_cadastro.style.width = '360px'
  div_login.style.width = '540px'

  div_cadastro.innerHTML = `

    <h1>Olá, seja bem vindo!</h1>
    <h3>Cria sua conta gratuitamente!</h3>
    <div class="login">
      <button id="cadastrar" onclick="cadastrar()">Cadastrar-se</button>
    </div>
    `
  div_login.innerHTML = `

    <h2>Entrar na minha conta</h2>
    <!--Icones aqui-->
    <div class="logosd">
    <img class="logo" id="google" src="../CSS/Logo/google-logo.png">
    <img class="logo" id="linke" src="../CSS/Logo/linkedin logo.png">
    <img class="logo" id="face" src="../CSS/Logo/facebook logo.png">
    </div>



    <div class="inputs"><span id="texto">
        <h4>E-mail</h4>
        <input type="text" class="inpute" placeholder="E-mail" id='email_inp'>
    </div>

    <div class="inputs"><span id="texto">
        <h4>Senha</h4>
        <input type="text" class="inpute" placeholder="Senha" id='senha_inp'>
    </div>
    <div class="login">
      <button id="cadastrar" onclick="login()">Entrar</button>
    </div> `
}


// window.addEventListener("load", start)
 */