// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Text Form Field',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String value;
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Text Form Field')),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              child: Row(
                children: [
                  SizedBox(
                    width: size.width * 0.45,
                    child: TextFormField(
                      controller: emailcontroller,
                      decoration: const InputDecoration(
                        hintText: "Enter Email",
                        labelText: "Email",
                        prefixIcon: Icon(Icons.email),
                      ),
                      validator: (value) {
                        if (value!.isEmpty ||
                            !RegExp(r'^[\w-\,]+@([\w-]+\.)').hasMatch(value)) {
                          return 'Your Email Must Contain "@" and "."';
                        } else {
                          return null;
                        }
                      },
                      keyboardType: TextInputType.text,
                      onChanged: (text) {
                        value = text;
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  SizedBox(
                    width: size.width * 0.45,
                    child: TextFormField(
                      controller: passcontroller,
                      decoration: const InputDecoration(
                        hintText: "Enter Password",
                        labelText: "Password",
                        prefixIcon: Icon(Icons.key),
                      ),
                      validator: (value) {
                        if (value!.isEmpty ||
                            !RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                                .hasMatch(value)) {
                          return 'Your Password Must Contain Capital Letter and Number';
                        } else {
                          return null;
                        }
                      },
                      autofocus: true,
                      keyboardType: TextInputType.text,
                      onChanged: (text) {
                        value = text;
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          RaisedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                setState(() {});
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Form Submitted')),
                );
              }
            },
            child: const Text('Submit'),
          ),
          Text("Email: ${emailcontroller.text}"),
          Text("Password: ${passcontroller.text}"),
        ],
      ),
    );
  }
}
