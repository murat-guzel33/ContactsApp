import 'package:contacts_app/data/entity/persons.dart';
import 'package:contacts_app/ui/views/detail_page.dart';
import 'package:contacts_app/ui/views/registration_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool search_being_done = false;

  @override
  Widget build(BuildContext context) {
    Future<void> search(String aramaKelimesi) async {
      print("kişi ara: $aramaKelimesi");
    }

    Future<List<Persons>> downloadPersons() async {
      var personsList = <Persons>[];
      var k1 = Persons(kisi_id: 0, kisi_ad: "Murat", kisi_tel: "1111");
      var k2 = Persons(kisi_id: 1, kisi_ad: "Azize", kisi_tel: "2222");
      var k3 = Persons(kisi_id: 2, kisi_ad: "Nazlı", kisi_tel: "3333");
      personsList.add(k1);
      personsList.add(k2);
      personsList.add(k3);
      return personsList;
    }

    Future<void> delete(int kisi_id) async {
      print("kişi sil: $kisi_id");
    }

    return Scaffold(
      appBar: AppBar(
        title: search_being_done
            ? TextField(
                decoration: InputDecoration(hintText: "Ara"),
                onChanged: (aramaSonucu) {
                  search(aramaSonucu);
                },
              )
            : const Text("Kişiler"),
        actions: [
          search_being_done
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      search_being_done = false;
                    });
                  },
                  icon: const Icon(Icons.clear))
              : IconButton(
                  onPressed: () {
                    setState(() {
                      search_being_done = true;
                    });
                  },
                  icon: const Icon(Icons.search))
        ],
      ),
      body: FutureBuilder<List<Persons>>(
        future: downloadPersons(),
        builder: (context, snapShot) {
          if (snapShot.hasData) {
            var personsList = snapShot.data;
            return ListView.builder(
              itemCount: personsList!.length,
              itemBuilder: (context, indeks) {
                var person = personsList[indeks];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                DetailPage(person: person))).then((value) {
                      print("returned to home page");
                    });
                  },
                  child: Card(
                    child: SizedBox(
                      height: 100,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  person.kisi_ad,
                                  style: TextStyle(fontSize: 20),
                                ),
                                Text(person.kisi_tel),
                              ],
                            ),
                          ),
                          const Spacer(),
                          IconButton(
                            onPressed: () {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text("${person.kisi_ad} silinsin mi?"),
                                action: SnackBarAction(
                                  label: "Evet",
                                  onPressed: () {
                                    delete(person.kisi_id);
                                  },
                                ),
                              ));
                            },
                            icon: const Icon(Icons.clear),
                            color: Colors.black54,
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const RegistrationPage()))
              .then((value) {
            print("returned to home page");
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
