import 'package:cviewer_frontend/di/assemble.dart';
import 'package:cviewer_frontend/domain/models/cv/cv.dart';
import 'package:logging/logging.dart';
import 'package:mobx/mobx.dart';

part 'cvs_loader.g.dart';

final _logger = Logger('CVs loader');

class CVsLoader = _CVsLoader with _$CVsLoader;

abstract class _CVsLoader with Store {
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
    isLoading = true;
    try {
      cvs = await _cvRepository.getCVs();
      error = null;
      hasLoadError = false;
      _logger.info('CVs were loaded');
    } catch (e) {
      error = e;
      hasLoadError = true;
      _logger.warning('Error occured: $e');
    } finally {
      isLoading = false;
    }
  }
}
