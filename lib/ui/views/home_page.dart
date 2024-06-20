import 'package:contacts_app/data/entity/persons.dart';
import 'package:contacts_app/ui/cubit/home_page_cubit.dart';
import 'package:contacts_app/ui/views/detail_page.dart';
import 'package:contacts_app/ui/views/registration_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool search_being_done = false;

  @override
  void initState() {
    super.initState();
    context.read<HomePageCubit>().downloadPersons();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: search_being_done
            ? TextField(
                decoration: InputDecoration(hintText: "Ara"),
                onChanged: (aramaSonucu) {
                  context.read<HomePageCubit>().search(aramaSonucu);
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
                    context.read<HomePageCubit>().downloadPersons();
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
      body: BlocBuilder<HomePageCubit, List<Persons>>(
        builder: (context, personsList) {
          if (personsList.isNotEmpty) {
            return ListView.builder(
              itemCount: personsList.length,
              itemBuilder: (context, indeks) {
                var person = personsList[indeks];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                DetailPage(person: person))).then((value) {
                      context.read<HomePageCubit>().downloadPersons();
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
                                    context
                                        .read<HomePageCubit>()
                                        .delete(person.kisi_id);
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
            context.read<HomePageCubit>().downloadPersons();
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
