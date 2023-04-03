import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sams/controllers/auth_controller.dart';



class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  Map<String, String> userSignupData = {
    "username": "",
    "email": "",
    "password": ""
  };

  AuthController controller = Get.find();

  signUp() {
    if (_formKey.currentState!.validate()) {
      print("Form is valid ");
      _formKey.currentState!.save();
      print('User Sign Up Data $userSignupData');
      controller.signUp(userSignupData['email'], userSignupData['password'],
          userSignupData['username']);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text('SignUp Screen'),
      ),
      body: Card(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Form(
            key: _formKey,
            child: Center(
              child: ListView(
                shrinkWrap: true,
                children: [
                  Container(
                    width: 300,
                    height: 350,
                    child: Image.asset(
                      'assets/images/undraw_Mobile_development_re_wwsn.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'User Name',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'User Name Required';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      userSignupData['username'] = value!;
                    },
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Email',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email Required';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      userSignupData['email'] = value!;
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(labelText: 'Password'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password Required';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      userSignupData['password'] = value!;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: signUp,
                    child: Text('Submit'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
