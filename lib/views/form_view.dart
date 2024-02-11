import 'package:flutter/material.dart';

class FormView extends StatefulWidget {
  const FormView({super.key});

  @override
  State<FormView> createState() => _FormViewState();
}

class _FormViewState extends State<FormView> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Username",
                labelText: "Username",
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "have a error";
                } else {
                  return null;
                }
              },
            ),
            const SizedBox(
              height: 30,
            ),
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Password",
                labelText: "Password",
              ),
              validator: (value) {
                formKey.currentState?.reset();
                if (value!.length < 6) {
                  return "minmum required 6 or more.";
                } else {
                  return null;
                }
              },
            ),
            IconButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    Navigator.of(context).pushNamed("/home");
                  } else {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(const SnackBar(content: Text("Error")));
                  }
                },
                icon: const Icon(Icons.check))
          ],
        ),
      ),
    );
  }
}
