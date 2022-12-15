import 'package:cviewer_frontend/data/network/service/base/c_viewer_service.models.swagger.dart' as dto;
import 'package:cviewer_frontend/domain/models/cv/cv_tag.dart';
import 'package:cviewer_frontend/utils/mapper.dart';

class CVTagFromDtoMapper implements Mapper<dto.CVTag, CVTag> {
  const CVTagFromDtoMapper();

  @override
  CVTag map(dto.CVTag data) {
    return CVTag(
      id: data.id,
      name: data.name,
    );
  }
}
