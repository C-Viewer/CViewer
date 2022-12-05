import 'package:cviewer_frontend/data/network/service/c_viewer_service.models.swagger.dart';
import 'package:cviewer_frontend/domain/models/tag/tag.dart';
import 'package:cviewer_frontend/utils/mapper.dart';

class CVTagFromDtoMapper implements Mapper<CVTag, Tag> {
  const CVTagFromDtoMapper();

  @override
  Tag map(CVTag data) {
    return Tag(
      id: data.id ?? 0,
      name: data.name ?? '',
    );
  }
}
