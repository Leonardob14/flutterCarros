import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

class LoginPage extends StatelessWidget {
  final _tLogin = TextEditingController();
  final _tSenha = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Carros"),
      ),
      body: _body(),
    );
  }

  _body() {
    return Form(
      key: _formKey,
      child: Container(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: <Widget>[
            _text("Login","Informe o login", controller: _tLogin, validator: _validadeLogin),
            SizedBox(height: 10),
           _text("Senha","Digite sua senha",
             controller: _tSenha, password: true, validator: _validadeSenha ),
            SizedBox(height: 20,),
            _button("Entrar", _onClickLogin)
          ],
        ),
      ),
    );
  }

   _text(String label, String hint,{bool password = false, TextEditingController controller,FormFieldValidator<String> validator}) {
    return TextFormField(
      controller: controller,
      obscureText: password ,
          validator: validator,
          decoration: InputDecoration(
            labelText: label,
            labelStyle: TextStyle(
              fontSize: 16,
//                color: Colors.white
            ),
            hintText: hint,
            hintStyle: TextStyle(
                fontSize: 12
            ),
          ),
        );
  }

  Container _button(text, Function onPressed) {
    return Container(
      height: 50,
      child: RaisedButton(
        color: Colors.lightGreen,
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }

  void _onClickLogin() {
    bool formOk = _formKey.currentState.validate();
    if(! formOk){
      return;
    }

    String login = _tLogin.text;
    String senha = _tSenha.text;

    print("Login: $login, Senha: $senha");
  }

  String _validadeLogin(String text) {
      if(text.isEmpty){
        return "Digite o login";
      }
      return null;
    }

  String _validadeSenha(String text) {
    if(text.isEmpty){
      return "Digite a senha";
    }
    return null;
  }

}
