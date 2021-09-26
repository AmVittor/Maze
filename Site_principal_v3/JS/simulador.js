var pessoas, plano, preco;

function fnCalculo() {
    pessoas = qtd_pessoas.value;
    plano = selecao.value;
    preco = input_preco.value;

    var visualizacoes_bruto = pessoas * Number(plano);
    var rendimento_bruto = visualizacoes_bruto * preco * 0.01;

    var visualizacoes_por_dia = pessoas;
    var visualizacoes_por_mes = pessoas * 30;

    var rendimento_por_dia = rendimento_bruto / Number(plano);
    var rendimento_por_mes = rendimento_por_dia * 30;

    resultado.innerHTML = `pessoas por dia ${pessoas}<br>
        plano ${plano}<br>
        preco ${preco}<br>
        visualizações bruto ${visualizacoes_bruto}<br>
        visualizações por dia ${visualizacoes_por_dia}<br>
        visualizações por mes ${visualizacoes_por_mes}<br>
        rendimento bruto ${rendimento_bruto}<br>
        rendimento por dia ${rendimento_por_dia}<br>
        rendimento por mes ${rendimento_por_mes}


        
        
        `;

}