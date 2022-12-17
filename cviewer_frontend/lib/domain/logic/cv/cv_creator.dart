import 'package:cviewer_frontend/di/assemble.dart';
import 'package:cviewer_frontend/domain/models/cv/cv_data.dart';
import 'package:cviewer_frontend/domain/models/cv/cv_tag.dart';
import 'package:cviewer_frontend/domain/models/errors.dart';
import 'package:cviewer_frontend/utils/loggers.dart';
import 'package:file_picker/file_picker.dart';
import 'package:mobx/mobx.dart';

part 'cv_creator.g.dart';

class CVCreator = _CVCreator with _$CVCreator;

abstract class _CVCreator with Store {
  final _cvRepository = Assemble.cvRepository;

  @observable
  List<CVTag>? tags;

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
  Future<void> loadTags() async {
    isLoading = true;
    try {
      tags = await _cvRepository.getTags();
      error = null;
      hasLoadError = false;
      Loggers.cvCreator.info('Tags were loaded');
    } catch (e) {
      error = e;
      hasLoadError = true;
      Loggers.cvCreator.warning('Error occured: $e');
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<void> selectCVFile() async {
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
  Future<void> removeCVFile() async {
    _file = null;
    fileName = null;
  }

  @action
  Future<bool> createDraft({
    required String title,
    required List<bool> selectedTags,
  }) async {
    isLoading = true;
    try {
      final f = _file?.bytes;
      final fn = fileName;
      final t = tags?.where((it) => selectedTags[tags!.indexOf(it)]).toList();

      if (f == null || fn == null || t == null) {
        throw ValidationError();
      } else {
        await _cvRepository.createCV(
          CVData(
            title: title,
            tags: t,
            fileName: fn,
            file: f,
          ),
        );
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
