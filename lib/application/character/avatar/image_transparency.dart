import 'dart:typed_data';
import 'dart:ui' as ui;

/// Наибольший размер файла, который примет сервер
const maxAvatarBytes = 5 * 1024 * 1024;

/// Прозрачен ли фон картинки: больше половины точек по краям почти прозрачны.
/// То же правило проверяют сервер и тест картинок, поэтому выбор
/// «фигуры» в редакторе совпадёт с ответом сервера.
Future<bool> hasTransparentBorder(Uint8List bytes) async {
  // Для проверки краёв хватает уменьшенной копии
  final codec = await ui.instantiateImageCodec(bytes, targetWidth: 256);
  final frame = await codec.getNextFrame();
  final image = frame.image;
  final data = await image.toByteData(format: ui.ImageByteFormat.rawRgba);
  final width = image.width, height = image.height;
  image.dispose();
  codec.dispose();
  if (data == null || width == 0 || height == 0) return false;

  int alpha(int x, int y) => data.getUint8((y * width + x) * 4 + 3);

  var clear = 0, total = 0;
  void check(int x, int y) {
    total++;
    if (alpha(x, y) < 16) clear++;
  }

  for (var x = 0; x < width; x++) {
    check(x, 0);
    check(x, height - 1);
  }
  for (var y = 0; y < height; y++) {
    check(0, y);
    check(width - 1, y);
  }

  return clear * 2 > total;
}
