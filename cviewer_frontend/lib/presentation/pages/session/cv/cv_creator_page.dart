import 'package:cviewer_frontend/assets/strings/l10n.dart';
import 'package:cviewer_frontend/domain/logic/cv/cv_creator.dart';
import 'package:cviewer_frontend/domain/models/cv/cv_tag.dart';
import 'package:cviewer_frontend/presentation/core/core_error_disposer.dart';
import 'package:cviewer_frontend/presentation/resources/app_colors.dart';
import 'package:cviewer_frontend/presentation/resources/decorations.dart';
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
                          cvCreator: _cvCreator,
                        ),
        ),
      ),
    );
  }
}

class _Content extends StatefulWidget {
  const _Content({
    required this.tags,
    required this.cvCreator,
  });

  final List<CVTag> tags;
  final CVCreator cvCreator;

  @override
  State<_Content> createState() => _ContentState();
}

class _ContentState extends State<_Content> {
  late final List<bool> _selectedTags;

  CVCreator get _cvCreator => widget.cvCreator;

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(32, 32, 32, 0),
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
                const SizedBox(height: 16),
                const Divider(height: 1),
                // Tags
                Expanded(
                  child: CVTagList(
                    tags: widget.tags,
                    isSelected: _selectedTags,
                    onPressed: _onTagPressed,
                  ),
                ),
              ],
            ),
          ),
        ),
        // Button panel
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          decoration: Decorations.buttonPanel,
          child: Row(
            children: [
              // File button
              Expanded(
                child: ElevatedButton(
                  onPressed: _cvCreator.selectCVFile,
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(AppColors.mint),
                  ),
                  child: Observer(
                    builder: (_) => (_cvCreator.fileName == null)
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.upload_rounded,
                                color: AppColors.white,
                                size: 18,
                              ),
                              const SizedBox(width: 10),
                              Flexible(
                                child: Text(
                                  S.of(context).cv,
                                ),
                              ),
                            ],
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Flexible(
                                child: Text(
                                  _cvCreator.fileName ?? '',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              const SizedBox(width: 10),
                              GestureDetector(
                                onTap: _cvCreator.removeCVFile,
                                child: const Icon(
                                  Icons.cancel_rounded,
                                  color: AppColors.lightGrey,
                                  size: 18,
                                ),
                              ),
                            ],
                          ),
                  ),
                ),
              ),
              const SizedBox(width: 30),
              // Save button
              Expanded(
                child: ElevatedButton(
                  onPressed: () => {},
                  child: Text(
                    S.of(context).save.toUpperCase(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
