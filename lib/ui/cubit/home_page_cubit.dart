import 'package:contacts_app/data/entity/persons.dart';
import 'package:contacts_app/repo/personsdao_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageCubit extends Cubit<List<Persons>> {
  HomePageCubit() : super(<Persons>[]);

  var prepo = PersonsdaoRepository();

  Future<void> downloadPersons() async {
    var list = await prepo.downloadPersons();
    emit(list);
  }

  Future<void> search(String aramaKelimesi) async {
    var list = await prepo.search(aramaKelimesi);
    emit(list);
  }

  Future<void> delete(int kisi_id) async {
    await prepo.delete(kisi_id);
    await prepo.downloadPersons();
  }
}
