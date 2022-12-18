import 'package:cviewer_frontend/di/assemble.dart';
import 'package:mobx/mobx.dart';

part 'cv_finish_reporter.g.dart';

class CVFinishReporter = _CVFinishReporter with _$CVFinishReporter;

abstract class _CVFinishReporter with Store {
  _CVFinishReporter({
    required this.expertId,
    required this.authorId,
    required this.cvId,
  });

  final int expertId;
  final int authorId;
  final int cvId;
  final _cvRepository = Assemble.cvRepository;

  @observable
  bool isLoading = false;

  @observable
  Object? error;

  @action
  Future<bool> sendReport({
    required int grade,
    required String? comment,
    required bool markCVAsBest,
  }) async {
    isLoading = true;
    try {
      await _cvRepository.markExpert(
        authorId: authorId,
        experdId: expertId,
        comment: comment,
        grade: grade,
      );
      if (markCVAsBest) {
        await _cvRepository.markCVAsBest(cvId);
      }
      error = null;
    } catch (e) {
      error = e;
    } finally {
      isLoading = false;
    }

    return error == null;
  }
}
