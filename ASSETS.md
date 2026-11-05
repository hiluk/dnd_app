# Изображения и шрифты

Картинки лежат в двух папках, и от папки зависит, как их показывает карточка:

- `assets/figures/` — **фигуры** на прозрачном фоне. На карточке фигура выходит
  за верхний край рамки. Тест `test/core/assets_test.dart` проверяет, что фон
  по краям каждой фигуры действительно прозрачный.
- `assets/images/` — **гравюры** со сценой. Они лежат внутри рамки и
  кадрируются по точке, заданной в перечислении расы или класса.

## Источники

Взяты с Wikimedia Commons под свободными лицензиями. Лицензии CC BY и CC BY-SA
требуют указывать автора; для CC BY-SA производные версии распространяются под
той же лицензией.

Фигуры — производные версии: фон удалён нейросетью (rembg, модели
isnet-general-use и birefnet-general), картинка обрезана по фигуре и уменьшена
до 900 px по высоте. У гравюр Говарда Пайла обрезана рамка скана.

### Фигуры

| Файл | Для | Источник | Автор | Лицензия |
|---|---|---|---|---|
| `figures/halfling.png` | Полурослик | [Halfling Thief.png](https://commons.wikimedia.org/wiki/File:Halfling_Thief.png) | Jonathan Torres | CC BY 4.0 |
| `figures/gnome.png` | Гном | [Il mio personaggio di d&d, sachi una gnoma dei boschi dalla pelle color ciliegi e i capelli verde smeraldo.jpg](https://commons.wikimedia.org/wiki/File:Il_mio_personaggio_di_d%26d,_sachi_una_gnoma_dei_boschi_dalla_pelle_color_ciliegi_e_i_capelli_verde_smeraldo.jpg) | Desyrota | CC BY-SA 4.0 |
| `figures/half_orc.png` | Полуорк | [Shain.png](https://commons.wikimedia.org/wiki/File:Shain.png) | David Revoy / Blender Foundation | CC BY 3.0 |
| `figures/tiefling.png` | Тифлинг | [Eugène Delacroix - Illustrations for Faust- Méphistophélés in the air - 1933.145.2 - Cleveland Museum of Art.jpg](https://commons.wikimedia.org/wiki/File:Eug%C3%A8ne_Delacroix_-_Illustrations_for_Faust-_M%C3%A9phistoph%C3%A9l%C3%A9s_in_the_air_-_1933.145.2_-_Cleveland_Museum_of_Art.jpg) | Eugène Delacroix | CC0 |
| `figures/bard.png` | Бард | [Welsh Druid playing the harp 02400.jpg](https://commons.wikimedia.org/wiki/File:Welsh_Druid_playing_the_harp_02400.jpg) | Thomas Pennant | Public domain |
| `figures/druid.png` | Друид | [The chief Druid, engraving.jpg](https://commons.wikimedia.org/wiki/File:The_chief_Druid,_engraving.jpg) | Thomas Pennant | Public domain |
| `figures/warlock.png` | Колдун | [Cendrea.png](https://commons.wikimedia.org/wiki/File:Cendrea.png) | David Revoy / Blender Foundation | CC BY 3.0 |

### Созданы нейросетью

| Файл | Для | Как сделано |
|---|---|---|
| `figures/paladin.png` | Паладин | Kling AI (kling-image-o1) по образцу `figures/warrior.png`, фон удалён rembg (isnet-general-use) |
| `figures/cleric.png` | Жрец | Kling AI (kling-image-o1), образцы стиля `figures/warrior.png`, `ranger.png`, `half_elf.png`; фон удалён rembg (isnet-general-use) |
| `figures/monk.png` | Монах | То же; лицо перерисовано отдельным запросом |
| `figures/sorcerer.png` | Чародей | То же |
| `figures/wizard.png` | Волшебник | То же; фон удалён rembg (birefnet-general), чтобы сохранить парящую книгу |

### Гравюры в рамке

| Файл | Для | Источник | Автор | Лицензия |
|---|---|---|---|---|
| `images/dwarf.jpg` | Дварф | [Illustration to Richard Wagner's "Das Rheingold".jpg](https://commons.wikimedia.org/wiki/File:Illustration_to_Richard_Wagner%27s_%22Das_Rheingold%22.jpg) | Arthur Rackham | Public domain |

## Без записанного источника — заменить до публикации

`figures/human.png`, `figures/half_elf.png`, `figures/elf.png`, `figures/dragon.png`,
`figures/warrior.png`, `figures/barbarian.png`, `figures/ranger.png`, `figures/thief.png`
и `images/human_plug.jpeg` были в проекте раньше; их источник и лицензия не записаны.
Метаданных об авторе в файлах нет, по стилю это арт из коммерческих игр, поэтому
считаем, что использовать их в опубликованном приложении нельзя. Решение: оставить
на время разработки и заменить своими иллюстрациями (Midjourney) до публикации.
У варвара, следопыта и плута фон дочищен нейросетью.

Шрифт Orpheus, который раньше был в заголовках, удалён: в его файле указано
«Copyright (c) Gophmann A.L., 2006. All rights reserved», то есть свободной
лицензии у него нет. Вместо него — Alegreya SC (OFL).

## Шрифты

| Файл | Назначение | Лицензия |
|---|---|---|
| `fonts/AlegreyaSC-*.ttf` | Имена и заголовки | SIL Open Font License 1.1, The Alegreya Project Authors; текст лицензии — `fonts/AlegreyaSC-OFL.txt` |
| `fonts/AlegreyaSans-*.ttf` | Текст и числа | SIL Open Font License 1.1, The Alegreya Project Authors (Huerta Tipográfica); текст лицензии — `fonts/AlegreyaSans-OFL.txt` |
