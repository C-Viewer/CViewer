import 'package:cviewer_frontend/di/assemble.dart';
import 'package:cviewer_frontend/domain/models/cv/cv_history.dart';
import 'package:cviewer_frontend/utils/loggers.dart';
import 'package:mobx/mobx.dart';

part 'cv_history_loader.g.dart';

class CVHistoryLoader = _CVHistoryLoader with _$CVHistoryLoader;

abstract class _CVHistoryLoader with Store {
  final _cvRepository = Assemble.cvRepository;

  @observable
  CVHistory? cvHistory;

  @observable
  bool isLoading = false;

  @observable
  bool hasLoadError = false;

  @observable
  Object? error;

  @action
  Future<void> loadCVHistory(int cvId) async {
    isLoading = true;
    try {
      cvHistory = await _cvRepository.getCVHistory(cvId);
      error = null;
      hasLoadError = false;
      Loggers.cvHistoryLoader.info('CV history was loaded');
    } catch (e) {
      error = e;
      hasLoadError = true;
      Loggers.cvHistoryLoader.warning('Error occured: $e');
    } finally {
      isLoading = false;
    }
  }
}
