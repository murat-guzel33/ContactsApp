import 'package:contacts_app/data/entity/persons.dart';

class PersonsdaoRepository {
  Future<void> save(String kisi_Ad, String kisi_tel) async {
    print("kisi kaydet: $kisi_Ad - $kisi_tel");
  }

  Future<void> update(int kisi_id, String kisi_Ad, String kisi_tel) async {
    print("kisi Güncelle:$kisi_id $kisi_Ad - $kisi_tel");
  }

  Future<void> delete(int kisi_id) async {
    print("kişi sil: $kisi_id");
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

  Future<List<Persons>> search(String aramaKelimesi) async {
    var personsList = <Persons>[];
    var k1 =
        Persons(kisi_id: 0, kisi_ad: "Murat", kisi_tel: "+90 538 392 2037");
    personsList.add(k1);
    return personsList;
  }
}
