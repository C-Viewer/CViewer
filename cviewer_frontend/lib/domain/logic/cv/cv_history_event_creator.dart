import 'package:cviewer_frontend/di/assemble.dart';
import 'package:cviewer_frontend/domain/models/cv/cv_history_event_data.dart';
import 'package:cviewer_frontend/domain/models/file/file_info.dart';
import 'package:file_picker/file_picker.dart';
import 'package:mobx/mobx.dart';

part 'cv_history_event_creator.g.dart';

class CVHistoryEventCreator = _CVHistoryEventCreator
    with _$CVHistoryEventCreator;

abstract class _CVHistoryEventCreator with Store {
  _CVHistoryEventCreator({
    required this.cvId,
    required this.authorId,
  });

  final int cvId;
  final int authorId;
  final _cvRepository = Assemble.cvRepository;

  @observable
  bool isLoading = false;

  @observable
  bool hasLoadError = false;

  @observable
  Object? error;

  @observable
  String? fileName;

  PlatformFile? _file;

  @action
  Future<void> selectFile() async {
    try {
      final result = await FilePicker.platform.pickFiles();
      final f = result?.files.single;
      if (f != null) {
        fileName = f.name;
        _file = f;
      }
    } catch (e) {
      error = e;
    }
  }

  @action
  Future<void> removeFile() async {
    _file = null;
    fileName = null;
  }

  @action
  Future<bool> createEvent({
    required String? comment,
    required int? grade,
  }) async {
    isLoading = true;
    try {
      final f = _file?.bytes;
      final fn = fileName;

      await _cvRepository.createHistoryEvent(
        CVHistoryEventData(
          cvId: cvId,
          authorId: authorId,
          fileInfo: (f != null && fn != null)
              ? FileInfo(
                  fileName: fn,
                  file: f,
                )
              : null,
          comment: comment,
          grade: grade,
        ),
      );
      error = null;
    } catch (e) {
      error = e;
    } finally {
      isLoading = false;
    }

    return error == null;
  }
}
