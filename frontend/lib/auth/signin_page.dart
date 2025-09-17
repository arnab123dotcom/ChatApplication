import 'package:chatapp/auth/signup_page.dart';
import 'package:chatapp/services/auth_service.dart';
import 'package:chatapp/chatwin/chatwin_page_test.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool booli = true;
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  var visibility = Icons.visibility_off;

  final _authService = AuthService();

  void _handleAuth() async {
    final success = await _authService.signIn(
      email: _email.text,
      password: _password.text,
    );

    if (success) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ChatWinPage()),
      );
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Sign In Failed")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: Center(
        child: Container(
          padding: EdgeInsets.all(10),
          height: 300,
          width: 200,
          child: Column(
            children: [
              //signIn
              Text(
                "Sign In.",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 10),
              //Textfield
              TextField(
                controller: _email,
                textAlign: TextAlign.start,
                decoration: InputDecoration(
                  hintText: "Email",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black45, width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 10),
              //Obscured Textfield
              TextField(
                controller: _password,
                textAlign: TextAlign.start,
                decoration: InputDecoration(
                  hintText: "Password",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black45, width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        if (booli == true) {
                          booli = false;
                          visibility = Icons.visibility;
                        } else {
                          booli = true;
                          visibility = Icons.visibility_off;
                        }
                      });
                    },
                    icon: Icon(visibility),
                  ),
                ),
                obscureText: booli,
                obscuringCharacter: "*",
              ),
              SizedBox(height: 10),
              //signin button
              ElevatedButton(
                onPressed: () {
                  _handleAuth();
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.teal),
                  foregroundColor: WidgetStateProperty.all(Colors.black),
                ),
                child: Text(
                  "Sign In",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(height: 14),
              //navigation text to signup page
              GestureDetector(
                child: Text(
                  "Don't Have Account? Click To Sign Up.",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUpPage()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
