// form application example
import 'package:flutter/material.dart';
import 'package:qnb_finansbank_flutter_w2_d1/pages/getx_counter_page.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const appTitle = "Form App Ornek";

    return MaterialApp(
      title: appTitle,
      home: GetxCounterPage(),

      // Scaffold(
      //   appBar: AppBar(
      //     title: const Text(appTitle),
      //   ),
      //   body: const MyCustomForm(),
      // ),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();

  final emailTextEditingController = TextEditingController();

  final passwordTextEditingController = TextEditingController();

// servisten response gelir gibi yapan fonk.
  bool handleUser() {
    if (emailTextEditingController.text == "qnbfinansbank" &&
        passwordTextEditingController.text == "123456") {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          // email alanı
          TextFormField(
            controller: emailTextEditingController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Bu alan boş bırakılamaz';
              } else {
                return null;
              }
            },
          ),

          // password alanı
          TextFormField(
            controller: passwordTextEditingController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Bu alan boş bırakılamaz';
              } else {
                return null;
              }
            },
          ),
          ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate() && handleUser()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Giriş başarılı')));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Kullanıcı adı veya şifre hatalı!!')));
                }
              },
              child: const Text('Giriş')),

          ElevatedButton(
              onPressed: () {
                emailTextEditingController.clear();
                //emailTextEditingController.dispose();

                passwordTextEditingController.clear();
              },
              child: const Text('temizle'))
        ],
      ),
    );
  }
}
