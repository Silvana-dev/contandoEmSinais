import 'package:flutter/material.dart';
import 'package:flutter_application_sinais/pages/class/client.dart';
import 'package:flutter_application_sinais/pages/pageNumbers.dart';
import 'package:flutter_application_sinais/pages/reset-password.dart';
import 'package:flutter_application_sinais/pages/signup.dart';

class LoginPage extends StatelessWidget {
  TextEditingController textControllerEmail = TextEditingController();
  TextEditingController textControllerSenha = TextEditingController();
  String senha = '';
  String email = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
          top: 60,
          left: 40,
          right: 40,
        ),
        color: Colors.red[50],
        child: ListView(
          children: <Widget>[
            Container(
              width: 168,
              height: 168,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(59),
                ),
              ),
              child: SizedBox.expand(
                child: Image.asset("assets/logo.png"),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            TextFormField(
              controller: textControllerEmail,
              autofocus: true,
              keyboardType: TextInputType.emailAddress,
              validator: (email) {
                return (textControllerEmail.text != null &&
                        textControllerEmail.text.contains('@'))
                    ? 'Do not use the @ char'
                    : null;
              },
              decoration: InputDecoration(
                labelText: "E-mail",
                labelStyle: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: textControllerSenha,
              autofocus: true,
              keyboardType: TextInputType.text,
              obscureText: true,
              validator: (senha) {
                return (textControllerSenha.text != null)
                    ? 'Do not user password'
                    : null;
              },
              decoration: InputDecoration(
                labelText: "Senha",
                labelStyle: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
              style: TextStyle(fontSize: 20),
            ),
            Container(
              height: 40,
              alignment: Alignment.centerRight,
              child: FlatButton(
                child: Text(
                  "Recuperar Senha",
                  textAlign: TextAlign.right,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResetPssword(),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 60,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.38, 1],
                  colors: [
                    Color(0xFFF58538),
                    Color(0xFFF92B7F),
                  ],
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(7),
                ),
              ),
              child: SizedBox.expand(
                child: FlatButton(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Login",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        Container(
                          child: SizedBox(
                            child: Image.asset("assets/lg-icon.png"),
                            height: 45,
                            width: 45,
                          ),
                        ),
                      ],
                    ),
                    onPressed: () {
                      //Future<List<Client>> listaCliente;
                      //listaCliente = Client().loginUser(email);

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PageNumbers(),
                        ),
                      );
                    }),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 60,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                color: Color(0xFF3C5A99),
                borderRadius: BorderRadius.all(
                  Radius.circular(7),
                ),
              ),
              child: SizedBox.expand(
                child: FlatButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Login com Facebook",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Container(
                        child: SizedBox(
                          child: Image.asset("assets/fb-icon.png"),
                          width: 28,
                          height: 28,
                        ),
                      )
                    ],
                  ),
                  onPressed: () {},
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 40,
              child: FlatButton(
                  child: Text(
                    "Não possue cadastro? Cadastre-se",
                    textAlign: TextAlign.center,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Signup(),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
