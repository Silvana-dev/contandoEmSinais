import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_sinais/pages/class/client.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sqflite/sqflite.dart';
import 'class/Utility.dart';
import 'dart:async';
import 'package:path/path.dart';

class Signup extends StatefulWidget {
  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  File? image;

  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerSenha = TextEditingController();
  TextEditingController _controllerName = TextEditingController();

  Client _client = new Client();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 30, left: 40, right: 40),
        color: Colors.red[50],
        child: ListView(
          children: <Widget>[
            image == null
                ? Container(
                    width: 165,
                    height: 165,
                    alignment: Alignment(-0.1, 1.45),
                    // image != null? Image.file(image!,width: 165,height: 165, fit:BoxFit.cover),
                    decoration: new BoxDecoration(
                      image: new DecorationImage(
                        image: AssetImage("assets/profile-picture.png"),
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  )
                : ClipOval(
                    child: Image.file(
                      image!,
                      width: 165,
                      height: 300,
                      fit: BoxFit.cover,
                    ),
                  ),
            //--------
            Container(
              height: 60,
              width: 10,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.38, 1.0],
                  colors: [
                    Color(0xFFF58538),
                    Color(0xFFF92B7F),
                  ],
                ),
                border: Border.all(width: 1.0, color: const Color(0xFFFFFFFF)),
                borderRadius: BorderRadius.all(
                  Radius.circular(500),
                ),
              ),
              child: SizedBox.expand(
                child: FlatButton(
                  child: Image(
                    image: AssetImage("assets/cam.png"),
                    width: 55,
                    height: 55,
                  ),
                  onPressed: () => pickImage(),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            TextFormField(
              controller: _controllerName,
              keyboardType: TextInputType.text,
              validator: (value) => nameValidator(value),
              decoration: InputDecoration(
                labelText: "Nome",
                labelStyle: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _controllerEmail,
              keyboardType: TextInputType.emailAddress,
              validator: (value) => emailValidator(value),
              decoration: InputDecoration(
                labelText: "E-mail",
                labelStyle: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _controllerSenha,
              keyboardType: TextInputType.text,
              validator: (value) => senhaValidator(value),
              obscureText: true,
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
                  child: Text(
                    "Cadastrar",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  onPressed: () async {
                    await _client.criarCliente(_controllerName.text,
                        _controllerEmail.text, _controllerSenha.text);
                  },
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 40,
              alignment: Alignment.center,
              child: FlatButton(
                child: Text(
                  "Cancelar",
                  textAlign: TextAlign.center,
                ),
                onPressed: () => Navigator.pop(context, false),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);

      if (image == null) return;

      // final imageTemporary = File(image.path);
      final imagPermanent = await saveImagePermanently(image.path);
      setState(() => {this.image = imagPermanent});
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future<File> saveImagePermanently(String imagePath) async {
    final directory =
        await Directory('Documents/photos').create(recursive: true);
    final name = basename(imagePath);
    final image = File('${directory.path}/$name');
    _client.setPhoto(image.path);
    return File(imagePath).copy(image.path);
  }

  //validação da from de cadastro
  emailValidator(String? value) {
    if (value!.isEmpty) {
      return null;
    }
    return 'required field';
  }

  nameValidator(String? value) {
    if (value!.isEmpty) {
      return null;
    }
    return 'required field';
  }

  senhaValidator(String? value) {
    if (value!.isEmpty) {
      return null;
    }
    return 'required field';
  }
}
