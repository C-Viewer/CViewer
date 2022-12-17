import 'package:cviewer_frontend/di/assemble.dart';
import 'package:cviewer_frontend/domain/models/cv/cv.dart';
import 'package:cviewer_frontend/domain/models/cv/cv_list_type.dart';
import 'package:cviewer_frontend/utils/loggers.dart';
import 'package:mobx/mobx.dart';

part 'cv_list_loader.g.dart';

class CVListLoader = _CVListLoader with _$CVListLoader;

abstract class _CVListLoader with Store {
  _CVListLoader({
    required this.type,
  });

  final CVListType type;
  final _cvRepository = Assemble.cvRepository;

  @observable
  List<CV> cvList = [];

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
      cvList = await _cvRepository.getCVs(type);
      error = null;
      hasLoadError = false;
      Loggers.cvsLoader.info('CVs were loaded');
    } catch (e) {
      error = e;
      hasLoadError = true;
      Loggers.cvsLoader.warning('Error occured: $e');
    } finally {
      isLoading = false;
    }
  }
}
