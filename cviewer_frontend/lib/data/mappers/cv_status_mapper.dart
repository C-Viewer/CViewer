import 'package:cviewer_frontend/data/network/service/c_viewer_service.enums.swagger.dart';
import 'package:cviewer_frontend/domain/models/cv/cv_status.dart';
import 'package:cviewer_frontend/utils/mapper.dart';

class CVStatusMapper implements Mapper<CVStatusType, CVStatus> {
  const CVStatusMapper();

  // TODO: разобраться со статусами
  @override
  CVStatus map(CVStatusType data) {
    switch (data) {
      case CVStatusType.draft:
        return CVStatus.draft;
      case CVStatusType.senttoreview:
        return CVStatus.availableForReview;
      case CVStatusType.takentoreview:
        return CVStatus.onReview;
      case CVStatusType.commentedgradedneedfix:
        return CVStatus.fixRequired;
      case CVStatusType.maxgrade:
      case CVStatusType.finishedwithgrade:
        return CVStatus.marked;
      case CVStatusType.finishwithcompany:
      case CVStatusType.publishedingoodstore:
      case CVStatusType.swaggerGeneratedUnknown:
        return CVStatus.finished;
    }
  }
}
