//Alunos:João Carlos,Ricardo JUnior e Amanda Lais.
import 'dart:io';

void main(List<String> arguments) {
  print("Calculadora legalzinha.");

  var num1 = num.parse(input(
    label: "Primeiro número: ",
    isNumber: true,
  ));

  String oper;
  bool triedOnce = false;
  do {
    if (triedOnce) {
      print("Operação inválida, tente novamente");
    }
    oper = input(label: "Operação: ");
    triedOnce = true;
  } while (![
    '/',
    '*',
    '-',
    '+',
  ].contains(oper));

  var num2 = num.parse(input(
    label: "Segundo número: ",
    isNumber: true,
  ));

  var prefix = "Resultado: ";

  switch (oper) {
    case '/':
      if (num2 == 0) {
        print("Segundo número não pode ser $num2");
        break;
      }
      print("$prefix" "${num1 / num2}");
      break;
    case '*':
      print("$prefix" "${num1 * num2}");
      break;
    case '-':
      print("$prefix" "${num1 - num2}");
      break;
    case '+':
      print("$prefix" "${num1 + num2}");
      break;
  }
}

String input({
  String? label,
  bool isNumber = false,
}) {
  String result;
  bool triedOnce = false;
  do {
    if (triedOnce) {
      print("Valor inválido, tente novamente");
    }
    if (label != null) stdout.write(label);
    result = stdin.readLineSync()?.trim() ?? "";
    triedOnce = true;
  } while (isNumber && num.tryParse(result) == null);
  return result;
}
