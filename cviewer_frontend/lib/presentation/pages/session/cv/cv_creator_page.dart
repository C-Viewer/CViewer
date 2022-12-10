import 'package:cviewer_frontend/assets/strings/l10n.dart';
import 'package:cviewer_frontend/domain/logic/cv/cv_creator.dart';
import 'package:cviewer_frontend/domain/models/cv/cv_tag.dart';
import 'package:cviewer_frontend/presentation/core/core_error_disposer.dart';
import 'package:cviewer_frontend/presentation/resources/app_colors.dart';
import 'package:cviewer_frontend/presentation/ui_adapters/error_ui_adapter.dart';
import 'package:cviewer_frontend/presentation/widgets/cv_tags/cv_tag_list.dart';
import 'package:cviewer_frontend/presentation/widgets/loaders/default_loader.dart';
import 'package:cviewer_frontend/presentation/widgets/placeholders/load_error_placeholder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CVCreatorPage extends StatefulWidget {
  const CVCreatorPage({
    super.key,
  });

  @override
  State<CVCreatorPage> createState() => _CVCreatorPageState();
}

class _CVCreatorPageState extends State<CVCreatorPage> {
  final _cvCreator = CVCreator();

  @override
  void initState() {
    super.initState();
    _cvCreator.loadTags();
  }

  void _onReload() {
    _cvCreator.loadTags();
  }

  @override
  Widget build(BuildContext context) {
    return ReactionBuilder(
      builder: (_) => coreErrorDisposer(
        context,
        (_) => _cvCreator.error,
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            S.of(context).cvCreator,
          ),
        ),
        body: Observer(
          builder: (_) =>
              // Loading
              _cvCreator.isLoading
                  ? const DefaultLoader()
                  // Load error
                  : _cvCreator.hasLoadError
                      ? LoadErrorPlaceholder(
                          error: ErrorUiAdapter(
                            context,
                            error: _cvCreator.error,
                          ),
                          onReload: _onReload,
                        )
                      // Content
                      : _Content(
                          tags: _cvCreator.tags!,
                        ),
        ),
      ),
    );
  }
}

class _Content extends StatefulWidget {
  const _Content({
    required this.tags,
  });

  final List<CVTag> tags;

  @override
  State<_Content> createState() => _ContentState();
}

class _ContentState extends State<_Content> {
  late final List<bool> _selectedTags;

  @override
  void initState() {
    super.initState();
    _selectedTags = List.generate(
      widget.tags.length,
      (_) => false,
    );
  }

  void _onTagPressed(int i) {
    setState(() => _selectedTags[i] = !_selectedTags[i]);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Label
          Text(
            S.of(context).title,
            style: Theme.of(context).textTheme.headline6?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
          ),
          // Title
          TextField(
            decoration: InputDecoration(
              hintText: S.of(context).titleHint,
            ),
          ),
          const SizedBox(height: 40),
          // Label
          Text(
            S.of(context).tags,
            style: Theme.of(context).textTheme.headline6?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
          ),
          const Divider(
            height: 16,
          ),
          // Tags
          CVTagList(
            tags: widget.tags,
            isSelected: _selectedTags,
            onPressed: _onTagPressed,
          ),
          const Divider(
            height: 16,
          ),
          // Button
          ElevatedButton(
              onPressed: () => {},
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(AppColors.mint),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.upload_rounded,
                    color: AppColors.white,
                  ),
                  Text(
                    S.of(context).cv,
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
