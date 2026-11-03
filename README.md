# dnd_app

Flutter-клиент помощника игрока D&D: регистрация и вход, создание персонажа
(раса → класс → характеристики → имя), просмотр и удаление персонажей.

Бэкенд — [hiluk/dnd_api](https://github.com/hiluk/dnd_api).

## Запуск

Нужен Flutter 3.24 (Dart 3.5) — под него зафиксированы зависимости в `pubspec.lock`.

1. Запустите бэкенд (по умолчанию на `http://localhost:5000`), см. README в `dnd_api`:

   ```bash
   docker compose up --build
   ```

2. Запустите приложение:

   ```bash
   flutter run
   ```

Адрес API выбирается автоматически: `http://10.0.2.2:5000` в Android-эмуляторе
(так эмулятор видит localhost компьютера) и `http://localhost:5000` на остальных платформах.
Для реального телефона или другого адреса передайте его при сборке:

```bash
flutter run --dart-define=API_URL=http://192.168.1.10:5000
```

## Разработка

После изменения моделей (freezed, json_serializable) или зависимостей DI (injectable):

```bash
dart run build_runner build --delete-conflicting-outputs
```

Проверки:

```bash
flutter analyze
```

```bash
flutter test
```

## Устройство

- `lib/core` — инфраструктура: DI (get_it + injectable), HTTP-клиент на Dio
  с интерсептором авторизации, хранение токенов (flutter_secure_storage),
  справочники рас и классов (`CatalogRepository`), роутер (go_router), UI-kit.
- `lib/application` — фичи: `auth`, `character` (список и карточка персонажа),
  `character_creating` (мастер создания).

Токены: access подставляется в каждый запрос; при ответе 401 интерсептор один раз
обновляет пару через `/refresh` и повторяет запрос. Если refresh отклонён,
токены удаляются и пользователь попадает на экран входа.

Расы и классы приходят с сервера номерами (`characterRace`, `characterClass`)
и сопоставляются со справочником по названию — названия в `CharacterRaceType`
и `CharacterClassType` должны совпадать с данными сервера.
