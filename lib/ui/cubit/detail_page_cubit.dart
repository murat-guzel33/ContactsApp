import 'package:contacts_app/repo/personsdao_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailPageCubit extends Cubit<void> {
  DetailPageCubit() : super(0);
  var prepo = PersonsdaoRepository();

  Future<void> update(int kisi_id, String kisi_Ad, String kisi_tel) async {
    await prepo.update(kisi_id, kisi_Ad, kisi_tel);
  }
}
