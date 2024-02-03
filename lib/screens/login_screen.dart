import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: Colors.blue,
            padding: EdgeInsets.all(16),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      children: [
                        FlutterLogo(size: 76),
                        SizedBox(height: 16),
                        TextField(
                          controller: _emailController,
                          decoration: InputDecoration(hintText: 'E-mail'),
                        ),
                        SizedBox(height: 16),
                        TextField(
                          obscureText: true,
                          controller: _senhaController,
                          decoration: InputDecoration(hintText: 'Senha'),
                        ),
                        SizedBox(height: 16),
                        ElevatedButton(onPressed: () {}, child: Text('Entrar')),
                        SizedBox(height: 16),
                        ElevatedButton(
                            onPressed: () {}, child: Text('Entrar com Google')),
                        SizedBox(height: 16),
                        TextButton(
                            onPressed: () {},
                            child: Text('Não tem cadastro, crie aqui.')),
                      ],
                    ),
                  )
                ],
              ),
            )));
  }
}
