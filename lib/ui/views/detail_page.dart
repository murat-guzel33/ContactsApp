import 'package:flutter/material.dart';
import 'package:contacts_app/data/entity/persons.dart';

class DetailPage extends StatefulWidget {
  Persons person;

  DetailPage({required this.person});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  var tfPersonName = TextEditingController();
  var tfPhoneNumber = TextEditingController();

  Future<void> update(int kisi_id, String kisi_Ad, String kisi_tel) async {
    print("kisi Güncelle:$kisi_id $kisi_Ad - $kisi_tel");
  }

  @override
  void initState() {
    super.initState();
    var person = widget.person;
    tfPersonName.text = person.kisi_ad;
    tfPhoneNumber.text = person.kisi_tel;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detay Sayfa"),
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
                    update(widget.person.kisi_id, tfPersonName.text,
                        tfPhoneNumber.text);
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          WidgetStateProperty.all<Color>(Colors.white54)),
                  child: const Text(
                    "GÜNCELLE",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
