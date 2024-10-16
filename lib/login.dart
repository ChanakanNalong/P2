import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

<<<<<<< HEAD
class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> sign_in() async {
    String url = "http://127.0.0.1/api/flutter_login/login.php";

    // Create a map for the request body
    final Map<String, String> requestBody = {
      'email': emailController.text, // Use the emailController here
      'password': passwordController.text, // Use the passwordController here
    };

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json", // Set the content type to application/json
        },
        body: json.encode(requestBody), // Encode the body as JSON
      );

      // Check if the response was successful
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        if (data['status'] == "success") {
          // Navigate to the home screen
          Navigator.pushNamed(context, 'home');
        } else {
          // Show error message
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error: ${data['message']}')),
          );
        }
      } else {
        // Handle server error
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: ${response.reasonPhrase}')),
        );
      }
    } catch (e) {
      print("Error: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: Could not connect to the server.')),
=======
class _loginState extends State<login> {
  final formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  Future signIn() async {
    String url = "http://172.16.10.226/api/flutter_login/login.php";
    final response = await http.post(Uri.parse(url), body: {
      'email': emailController.text,
      'password': passController.text,
    });

    var data = json.decode(response.body);

    if (data['status'] == "success") {
      Navigator.pushNamed(context, 'home');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login Failed')),
>>>>>>> c66e5c9b66245fbfd472d8e24c523bfd32f9eff9
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: Center(
        child: Form(
          key: formKey,
          child: ListView(
            shrinkWrap: true,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Welcome!',
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'To continue using this app',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    'Please sign in first.',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(height: 30),
                  Image.asset('assets/img/Picture.png'),
                  SizedBox(height: 20),
                  SizedBox(
                    width: 350,
                    child: TextFormField(
<<<<<<< HEAD
=======
                      controller: emailController,
                      obscureText: false,
>>>>>>> c66e5c9b66245fbfd472d8e24c523bfd32f9eff9
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email or Username',
                      ),
                      validator: (val) {
                        if (val!.isEmpty) {
<<<<<<< HEAD
                          return 'Empty';
                        }
                        return null;
                      },
                      controller: emailController,
=======
                          return 'Please enter email or username';
                        }
                        return null;
                      },
>>>>>>> c66e5c9b66245fbfd472d8e24c523bfd32f9eff9
                    ),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    width: 350,
                    child: TextFormField(
                      controller: passController,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                      ),
                      validator: (val) {
                        if (val!.isEmpty) {
<<<<<<< HEAD
                          return 'Empty';
                        }
                        return null;
                      },
                      controller: passwordController,
=======
                          return 'Please enter password';
                        }
                        return null;
                      },
>>>>>>> c66e5c9b66245fbfd472d8e24c523bfd32f9eff9
                    ),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    width: 350,
                    height: 60,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF3F60A0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
<<<<<<< HEAD
                          sign_in();
=======
                          signIn();
>>>>>>> c66e5c9b66245fbfd472d8e24c523bfd32f9eff9
                        }
                      },
                      child: const Text(
                        'Sign in',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'register');
                    },
                    child: const Text("Didn't have any Account? Sign Up now"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
