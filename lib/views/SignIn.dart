import 'package:chat_app/services/auth.dart';
import 'package:chat_app/views/ChatRoom.dart';
import 'package:chat_app/views/signup.dart';
import 'package:chat_app/widgets/BottomSheetFeedback.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool _isLoading = false;
  final TextEditingController _emailAddress = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  AuthMethods _authMethods = AuthMethods();

  _handleSignIn() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      _authMethods
          .signInWithEmailAndPassword(_emailAddress.text, _password.text)
          .then((value) {
        BottomSheetFeedback.showSuccess(context, 'Sukses', 'Login berhasil');
        Future.delayed(const Duration(milliseconds: 2000), () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => ChatRoom()));
        });
      }).catchError((error) {
        BottomSheetFeedback.showError(context, 'Error', error);
      });
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat App'),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Sign In',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
                ),
                SizedBox(height: 32),
                TextFormField(
                  controller: _emailAddress,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter your email address',
                    labelText: 'Email Addres',
                  ),
                  validator: (value) {
                    return value!.isEmpty || value.length < 1
                        ? 'Email is required!'
                        : null;
                  },
                ),
                SizedBox(height: 24),
                TextFormField(
                  controller: _password,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter your password',
                    labelText: 'Password',
                  ),
                  validator: (value) {
                    return value!.isEmpty || value.length < 1
                        ? 'Password is required!'
                        : null;
                  },
                ),
                SizedBox(height: 24),
                Container(
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            padding:
                                MaterialStateProperty.all(EdgeInsets.all(16)),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)))),
                        onPressed: () {
                          _handleSignIn();
                        },
                        child: Text('Sign In'))),
                SizedBox(height: 10),
                Container(
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.red),
                            padding:
                                MaterialStateProperty.all(EdgeInsets.all(16)),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)))),
                        onPressed: () {},
                        child: Text('Sign In with Google'))),
                SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have a account? "),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => SignUp()));
                      },
                      child: Text(
                        'Register now',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
