import 'package:chatapp/auth/signin_page.dart';
import 'package:chatapp/services/auth_service.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool booli = true;
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _email = TextEditingController();
  var visibility = Icons.visibility_off;
  final _authService = AuthService();

  //bool _isSignUp = true;

  void _handleAuth() async {
    final success = await _authService.signUp(
      username: _username.text,
      email: _email.text,
      password: _password.text,
    );

    if (success) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Sign Up Successful!")));
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Sign Up Failed.")));
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
                "Sign Up.",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 10),
              //Username
              TextField(
                controller: _username,
                textAlign: TextAlign.start,
                decoration: InputDecoration(
                  hintText: "Username",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black45, width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 10),
              //password
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
              //email
              TextField(
                controller: _email,
                textAlign: TextAlign.start,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: "Email",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black45, width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 10),
              //signup button
              ElevatedButton(
                onPressed: () {
                  _handleAuth();
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.teal),
                  foregroundColor: WidgetStateProperty.all(Colors.black),
                ),
                child: Text(
                  "Sign Up",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(height: 14),
              //navigation text to signup page
              GestureDetector(
                child: Text(
                  "Go Sign In",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignInPage()),
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
