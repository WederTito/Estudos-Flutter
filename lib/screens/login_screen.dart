import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:teste/screens/register_screen.dart';
import 'package:teste/screens/reset_password_modal.dart';
import 'package:teste/services/auth_service.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  AuthService authService = AuthService();

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
                        ElevatedButton(
                            onPressed: () {
                              authService
                                  .entrarUsuario(
                                      email: _emailController.text,
                                      senha: _senhaController.text)
                                  .then((String? erro) {
                                if (erro != null) {
                                  final snackBar = SnackBar(
                                      content: Text(erro),
                                      backgroundColor: Colors.red);
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                }
                              });
                            },
                            child: Text('Entrar')),
                        SizedBox(height: 16),
                        ElevatedButton(
                            onPressed: () {
                              signWithGoogle();
                            },
                            child: Text('Entrar com Google')),
                        SizedBox(height: 16),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => RegisterScreen(),
                                  ));
                            },
                            child: Text('Não tem cadastro, crie aqui.')),
                        TextButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return PasswordresetModal();
                                });
                          },
                          child: Text('Esqueceu a senha?'),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )));
  }

  Future<UserCredential> signWithGoogle() async {

    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication googleAuth =
    await googleUser!.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
