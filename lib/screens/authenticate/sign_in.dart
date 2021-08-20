import 'package:firsttest/services/auth.dart';
import 'package:flutter/material.dart';



class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text(
          'Sign in Anon',
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50),
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.black12),
          ),
          child: Text(
            'Sign in Anon'

          ),
          onPressed: () async {
                dynamic result = await _auth.signInAnon();
                if (result == null){
                  print('error sign in');
                }
                else{
                  print('user logged in');
                  print(result.uid);
                }
          },

        ),
      ),

    );
  }
}
