import 'package:contacts_app/repo/personsdao_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegistrationPageCubit extends Cubit<void> {
  RegistrationPageCubit() : super(0);
  var prepo = PersonsdaoRepository();

  Future<void> save(String kisi_Ad, String kisi_tel) async {
    await prepo.save(kisi_Ad, kisi_tel);
  }
}
