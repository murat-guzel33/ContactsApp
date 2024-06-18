import 'package:flutter/material.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  var tfPersonName = TextEditingController();
  var tfPhoneNumber = TextEditingController();

  Future<void> save(String kisi_Ad, String kisi_tel) async {
    print("kisi kaydet: $kisi_Ad - $kisi_tel");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kayıt Sayfa"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 50, right: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                controller: tfPersonName,
                decoration: const InputDecoration(hintText: "Person Name"),
              ),
              TextField(
                controller: tfPhoneNumber,
                decoration: const InputDecoration(hintText: "Phone Number"),
              ),
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        save(tfPersonName.text,tfPhoneNumber.text);
                      },
                      style: ButtonStyle(
                          backgroundColor:
                          WidgetStateProperty.all<Color>(Colors.white54)),
                      child: const Text(
                        "Save",
                        style: TextStyle(color: Colors.black),
                      ))),
            ],
          ),
        ),
      ),
    );
  }
}
