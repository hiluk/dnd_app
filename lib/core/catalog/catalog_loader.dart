import 'package:dnd_app/core/catalog/catalog_repository.dart';
import 'package:dnd_app/core/di/di.dart';
import 'package:dnd_app/core/http_client/api_error.dart';
import 'package:flutter/material.dart';

/// Показывает [child], когда справочники рас и классов загружены.
/// Пока идёт загрузка — индикатор, при ошибке — кнопку повтора.
class CatalogLoader extends StatefulWidget {
  final Widget child;

  const CatalogLoader({super.key, required this.child});

  @override
  State<CatalogLoader> createState() => _CatalogLoaderState();
}

class _CatalogLoaderState extends State<CatalogLoader> {
  final _catalog = di.get<CatalogRepository>();
  late Future<void> _loading;

  @override
  void initState() {
    super.initState();
    _loading = _catalog.ensureLoaded();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: _loading,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(apiErrorMessage(snapshot.error!)),
                const SizedBox(height: 12),
                FilledButton(
                  onPressed: () => setState(() {
                    _loading = _catalog.ensureLoaded();
                  }),
                  child: const Text('Повторить'),
                ),
              ],
            ),
          );
        }

        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(child: CircularProgressIndicator());
        }

        return widget.child;
      },
    );
  }
}
