import 'package:cviewer_frontend/di/assemble.dart';
import 'package:cviewer_frontend/domain/models/resume/cv.dart';
import 'package:mobx/mobx.dart';

part 'cvs_holder.g.dart';

class CVsHolder = _CVsHolder with _$CVsHolder;

abstract class _CVsHolder with Store {
  final _cvRepository = Assemble.cvRepository;

  @observable
  List<CV> cvs = [];

  @observable
  bool isLoading = false;

  @observable
  bool hasLoadError = false;

  @observable
  Object? error;

  @action
  Future<void> loadCVs() async {
    try {
      isLoading = true;
      cvs = await _cvRepository.getCVs();
      isLoading = false;
      hasLoadError = false;
    } catch (e) {
      error = e;
      hasLoadError = true;
    }
  }
}
