String calcimc({required double peso, required double altura}) {
  double resultado = peso / (altura * altura);

  if (resultado < 16) {
    return "Magreza grave";
  } else if (resultado >= 16 && resultado < 17) {
    return "Magreza moderada";
  } else if (resultado >= 17 && resultado < 18.5) {
    return "Magreza leve";
  } else if (resultado >= 18.5 && resultado < 25) {
    return "Saudável";
  } else if (resultado >= 25 && resultado < 30) {
    return "Sobrepeso";
  } else if (resultado >= 30 && resultado < 35) {
    return "Obesidade Grau I";
  } else if (resultado >= 35 && resultado < 40) {
    return "Obesidade Grau II (severa)";
  } else if (resultado >= 40) {
    return "Obesidade Grau III (mórbida)";
  } else {
    return "Valor não identificado, tentar novamente";
  }
}
