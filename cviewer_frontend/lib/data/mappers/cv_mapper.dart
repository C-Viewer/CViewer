import 'package:cviewer_frontend/data/mappers/cv_status_mapper.dart';
import 'package:cviewer_frontend/data/mappers/cv_tag_mapper.dart';
import 'package:cviewer_frontend/data/network/service/base/c_viewer_service.models.swagger.dart';
import 'package:cviewer_frontend/domain/models/cv/cv.dart';
import 'package:cviewer_frontend/utils/mapper.dart';

class CVFromDtoMapper implements Mapper<Cv, CV> {
  const CVFromDtoMapper();

  @override
  CV map(Cv data) {
    return CV(
      id: data.id,
      title: data.title,
      description: data.description ?? '',
      status: const CVStatusMapper().map(data.statusId),
      creationDate: data.dateCreation,
      tags: data.tags?.map(const CVTagFromDtoMapper().map).toList() ?? [],
      rating: data.rating,
      pinnedFileName: data.pinnedFileName,
      pinnedFileUrl: data.urlFileForDownload,
      // TODO: убрать мок данные
      //  pinnedFileName: 'mock-file.txt',
      //  pinnedFileUrl: 'https://da728kfevltdk.cloudfront.net/hi.txt',
    );
  }
}
