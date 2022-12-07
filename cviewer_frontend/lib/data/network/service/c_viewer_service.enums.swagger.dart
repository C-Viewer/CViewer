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
  @JsonValue('CommentedGradedNeedFix')
  commentedgradedneedfix,
  @JsonValue('MaxGrade')
  maxgrade,
  @JsonValue('FinishedWithGrade')
  finishedwithgrade,
  @JsonValue('FinishWithCompany')
  finishwithcompany,
  @JsonValue('PublishedInGoodStore')
  publishedingoodstore
}

const $CVStatusTypeMap = {
  CVStatusType.draft: 'Draft',
  CVStatusType.senttoreview: 'SentToReview',
  CVStatusType.takentoreview: 'TakenToReview',
  CVStatusType.commentedgradedneedfix: 'CommentedGradedNeedFix',
  CVStatusType.maxgrade: 'MaxGrade',
  CVStatusType.finishedwithgrade: 'FinishedWithGrade',
  CVStatusType.finishwithcompany: 'FinishWithCompany',
  CVStatusType.publishedingoodstore: 'PublishedInGoodStore'
};
