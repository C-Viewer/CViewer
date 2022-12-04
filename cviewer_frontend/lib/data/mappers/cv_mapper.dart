import 'package:cviewer_frontend/data/network/service/c_viewer_service.models.swagger.dart';
import 'package:cviewer_frontend/domain/models/profile/profile.dart';
import 'package:cviewer_frontend/domain/models/resume/cv.dart';
import 'package:cviewer_frontend/domain/models/resume/resume_status.dart';
import 'package:cviewer_frontend/utils/mapper.dart';

class CVFromDtoMapper implements Mapper<Cv, CV> {
  const CVFromDtoMapper();

  @override
  // TODO: дополнить модель
  CV map(Cv data) {
    return CV(
      id: data.id ?? 0,
      title: data.title ?? '',
      // TODO: маппинг статуса
      status: ResumeStatus.draft,
      // TODO: маппинг тегов
      tags: [],
      // TODO: маппинг истории
      history: [],
    );
  }
}
