import 'package:cviewer_frontend/di/assemble.dart';
import 'package:cviewer_frontend/domain/models/cv/cv.dart';
import 'package:cviewer_frontend/utils/loggers.dart';
import 'package:mobx/mobx.dart';

part 'cv_loader.g.dart';

class CVLoader = _CVLoader with _$CVLoader;

abstract class _CVLoader with Store {
  final _cvRepository = Assemble.cvRepository;

  @observable
  CV? cv;

  @observable
  bool isLoading = false;

  @observable
  bool hasLoadError = false;

  @observable
  Object? error;

  @action
  Future<void> loadCV(int cvId) async {
    isLoading = true;
    try {
      cv = await _cvRepository.getCV(cvId);
      error = null;
      hasLoadError = false;
      Loggers.cvLoader.info('CV was loaded');
    } catch (e) {
      error = e;
      hasLoadError = true;
      Loggers.cvLoader.warning('Error occured: $e');
    } finally {
      isLoading = false;
    }
  }
}
