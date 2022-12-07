import 'package:cviewer_frontend/data/mappers/cv_status_mapper.dart';
import 'package:cviewer_frontend/data/mappers/cv_tag_mapper.dart';
import 'package:cviewer_frontend/data/network/service/c_viewer_service.enums.swagger.dart';
import 'package:cviewer_frontend/data/network/service/c_viewer_service.models.swagger.dart';
import 'package:cviewer_frontend/domain/models/cv/cv.dart';
import 'package:cviewer_frontend/utils/mapper.dart';

class CVFromDtoMapper implements Mapper<Cv, CV> {
  const CVFromDtoMapper();

  @override
  // TODO: дополнить модель
  CV map(Cv data) {
    return CV(
      id: data.id ?? 0,
      title: data.title ?? '',
      description: data.description ?? '',
      // TODO: non nullable property
      status: const CVStatusMapper().map(data.statusId ?? CVStatusType.draft),
      // TODO: устранить nullable-поле в респонсе или сделать nullable в модели
      creationDate: data.dateCreation ?? DateTime.now(),
      rating: data.rating ?? 0.0,
      tags: data.tags?.map(const CVTagFromDtoMapper().map).toList() ?? [],
      // TODO: маппинг истории
      history: [],
    );
  }
}
