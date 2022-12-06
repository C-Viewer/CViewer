import 'package:cviewer_frontend/presentation/core/core_error_handler.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

ReactionDisposer coreErrorDisposer(
  BuildContext context,
  Object? Function(Reaction) fn,
) {
  return reaction(
    fn,
    (error) {
      const CoreErrorHandler().onErrorOccured(context, error);
    },
  );
}
