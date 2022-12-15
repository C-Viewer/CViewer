import 'package:json_annotation/json_annotation.dart';

enum CVStatusType {
  @JsonValue('swaggerGeneratedUnknown')
  swaggerGeneratedUnknown,
  @JsonValue('Draft')
  draft,
  @JsonValue('SentToReview')
  senttoreview,
  @JsonValue('TakenToReview')
  takentoreview,
  @JsonValue('NeedFix')
  needfix,
  @JsonValue('Finished')
  finished
}

const $CVStatusTypeMap = {
  CVStatusType.draft: 'Draft',
  CVStatusType.senttoreview: 'SentToReview',
  CVStatusType.takentoreview: 'TakenToReview',
  CVStatusType.needfix: 'NeedFix',
  CVStatusType.finished: 'Finished'
};
