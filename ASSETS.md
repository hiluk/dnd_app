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

### Гравюры в рамке

| Файл | Для | Источник | Автор | Лицензия |
|---|---|---|---|---|
| `images/dwarf.jpg` | Дварф | [Illustration to Richard Wagner's "Das Rheingold".jpg](https://commons.wikimedia.org/wiki/File:Illustration_to_Richard_Wagner%27s_%22Das_Rheingold%22.jpg) | Arthur Rackham | Public domain |
| `images/cleric.jpg` | Жрец | [Paul in Ephesus (89485605).jpg](https://commons.wikimedia.org/wiki/File:Paul_in_Ephesus_(89485605).jpg) | Gustave Doré | Public domain |
| `images/monk.jpg` | Монах | [Benkei 辨慶 (BM 2008,3037.02001).jpg](https://commons.wikimedia.org/wiki/File:Benkei_%E8%BE%A8%E6%85%B6_(BM_2008,3037.02001).jpg) | Print artist:Utagawa Kuniyoshi (歌川国芳) | Public domain |
| `images/paladin.jpg` | Паладин | [Arthur-Pyle Sir Pellias, The Gentle Knight.JPG](https://commons.wikimedia.org/wiki/File:Arthur-Pyle_Sir_Pellias,_The_Gentle_Knight.JPG) | Howard Pyle | Public domain |
| `images/sorcerer.jpg` | Чародей | [Arthur-Pyle The Enchantress Vivien.JPG](https://commons.wikimedia.org/wiki/File:Arthur-Pyle_The_Enchantress_Vivien.JPG) | Howard Pyle | Public domain |
| `images/wizard.jpg` | Волшебник | [Arthur-Pyle The Enchanter Merlin.JPG](https://commons.wikimedia.org/wiki/File:Arthur-Pyle_The_Enchanter_Merlin.JPG) | Howard Pyle | Public domain |

## Без записанного источника

`figures/human.png`, `figures/half_elf.png`, `figures/elf.png`, `figures/dragon.png`,
`figures/warrior.png`, `figures/barbarian.png`, `figures/ranger.png`, `figures/thief.png`
и `images/human_plug.jpeg` были в проекте раньше; их источник и лицензия не записаны.
У варвара, следопыта и плута фон дочищен нейросетью. Перед публикацией приложения
эти картинки стоит проверить или заменить.

## Шрифты

| Файл | Назначение | Лицензия |
|---|---|---|
| `fonts/Orpheus.ttf` | Имена и заголовки | был в проекте раньше, лицензия не записана |
| `fonts/AlegreyaSans-*.ttf` | Текст и числа | SIL Open Font License 1.1, Juan Pablo del Peral (Huerta Tipográfica); текст лицензии — `fonts/AlegreyaSans-OFL.txt` |
