import 'package:cviewer_frontend/data/network/service/base/c_viewer_service.models.swagger.dart'
    as dto;
import 'package:cviewer_frontend/domain/models/cv/cv_history_event.dart';
import 'package:cviewer_frontend/domain/models/file/file_info.dart';
import 'package:cviewer_frontend/domain/models/profile/profile.dart';
import 'package:cviewer_frontend/utils/mapper.dart';

class CVHistoryEventFromDtoMapper
    implements Mapper<dto.CVHistory, CVHistoryEvent> {
  const CVHistoryEventFromDtoMapper({
    required this.author,
  });

  final Profile author;

  @override
  CVHistoryEvent map(dto.CVHistory data) {
    return CVHistoryEvent(
      id: data.id,
      creationDate: data.dateTime,
      author: author,
      comment: data.comment,
      grade: data.grade?.toDouble(),
      fileInfo: (data.fileName != null && data.amazonPathToFile != null)
          ? FileInfo(
              fileUrl: data.amazonPathToFile!,
              fileName: data.fileName!,
            )
          : null,
    );
  }
}
