import 'package:cviewer_frontend/data/network/service/base/c_viewer_service.enums.swagger.dart';
import 'package:cviewer_frontend/domain/models/cv/cv_status.dart';
import 'package:cviewer_frontend/utils/mapper.dart';

class CVStatusMapper implements Mapper<CVStatusType, CVStatus> {
  const CVStatusMapper();

  @override
  CVStatus map(CVStatusType data) {
    switch (data) {
      case CVStatusType.draft:
        return CVStatus.draft;
      case CVStatusType.senttoreview:
        return CVStatus.sentToReview;
      case CVStatusType.takentoreview:
        return CVStatus.takenOnReview;
      case CVStatusType.needfix:
        return CVStatus.needFix;
      case CVStatusType.finished:
      case CVStatusType.swaggerGeneratedUnknown:
        return CVStatus.finished;
    }
  }
}
