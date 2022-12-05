import 'package:cviewer_frontend/domain/logic/cv/cvs_holder.dart';
import 'package:cviewer_frontend/presentation/widgets/resume/resume_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CVsPage extends StatefulWidget {
  const CVsPage({super.key});

  @override
  State<CVsPage> createState() => _CVsPageState();
}

class _CVsPageState extends State<CVsPage> {
  final _cvsHolder = CVsHolder();

  @override
  void initState() {
    super.initState();
    _cvsHolder.loadCVs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(
        builder: (_) => _cvsHolder.isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : _cvsHolder.hasLoadError
                // TODO: кастомизировать UI при ошибке загрузки данных
                ? const Center(
                    child: Text('Load error'),
                  )
                : ResumeList(items: _cvsHolder.cvs),
      ),
      floatingActionButton: Observer(
        builder: (_) => !_cvsHolder.isLoading && !_cvsHolder.hasLoadError
            ? FloatingActionButton(
                onPressed: () {
                  // TODO: создание черновика CV
                },
                child: const Icon(Icons.create_rounded),
              )
            : const SizedBox(),
      ),
    );
  }
}
