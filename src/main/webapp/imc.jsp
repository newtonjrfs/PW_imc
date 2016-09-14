<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cálculo IMC</title>

</head>
<body>
  <h1>Cálculo IMC</h1>
  <form>
  Peso: <input type="text" name="peso" value="${param.peso}"><br>
  Altura: <input type="text" name="altura" value="${param.altura}"><br>
  Sexo: <input type="text" name="sexo" value="${param.sexo}"><br>
  <button>Calcular</button>
  </form>
<%
String pesoStr = request.getParameter("peso");
//Se o campo "peso" não foi informado, atribui "0", senão fica como está.
pesoStr = (pesoStr == null ? "0" : pesoStr);
int peso = 0;
try {
peso = Integer.parseInt(pesoStr);
} catch(Exception e) {
System.out.println(e);
}


String alturaStr = request.getParameter("altura");
//Se o campo "altura" não foi informado, atribui "0", senão fica como está.
alturaStr = (alturaStr == null ? "0" : alturaStr);
float altura = 0;
float imc = 0;
try {
altura = Integer.parsefloat(alturaStr);
float imc = peso / (altura*altura);
} catch(Exception e) {
System.out.println(e);
}

String sexoStr = request.getParameter("sexo");
//Se o campo "sexo" não foi informado, atribui "0", senão fica como está.

sexoStr = (sexoStr == null ? "0" : sexoStr);
sexoStr = (sexoStr == "masculino" ? "masculino" : sexoStr);
sexoStr = (sexoStr == "feminino" ? "feminino" : sexoStr);

int sexo = 0;
try {
sexo = Integer.parseInt(sexoStr);
} catch(Exception e) {
System.out.println(e);
}


if(sexoStr == "feminino"){
	if (imc > 0 && imc < 19.1) {
		  %><b>Abaixo do peso</b><%
		} else if (imc > 19.1 && imc < 25.8) {
		  %><b>No peso normal</b><%
		} else if(imc > 25.8 && imc < 27.3 ) {
		  %><b>Marginalmente acima do peso</b><%
		}else if(imc > 27.3 && imc < 32.3) {
		%><b>Acima do peso ideal</b><%
		}else {
			%><b>Obeso</b><%
		}
		
}else if(sexoStr == "masculino"){
	if (imc > 0 && imc < 20.7) {
		  %><b>Abaixo do peso</b><%
		} else if (imc > 20.7 && imc < 26.4) {
		  %><b>No peso normal</b><%
		} else if(imc > 26.4 && imc < 27.8 ) {
		  %><b>Marginalmente acima do peso</b><%
		}else if(imc > 27.8 && imc < 31.1) {
		%><b>Acima do peso ideal</b><%
		}else {
			%><b>Obeso</b><%
		}
		
}
%>
</body>
</html>