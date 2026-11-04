import 'package:dnd_app/application/session/bloc/session_cubit.dart';
import 'package:dnd_app/application/session/presentation/event_text.dart';
import 'package:dnd_app/core/ui_kit/dnd_palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Вкладка «Журнал»: события сессии, неотправленные — сверху
class JournalTab extends StatelessWidget {
  const JournalTab({super.key});

  @override
  Widget build(BuildContext context) {
    final p = DndPalette.of(context);

    return BlocBuilder<SessionCubit, SessionViewState>(
      builder: (context, view) {
        final events = view.events;
        final pending = view.pending.length;

        return ListView(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
          children: [
            if (pending > 0 && view.sync == SessionSync.offline)
              Container(
                margin: const EdgeInsets.only(bottom: 14),
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: p.gold.withOpacity(0.10),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: p.gold),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.cloud_off_outlined, color: p.gold, size: 20),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        '${_actions(pending)} ждут отправки. Мы отправим их, когда '
                        'появится связь. Хиты на экране уже посчитаны.',
                        style: const TextStyle(fontSize: 15, height: 1.35),
                      ),
                    ),
                  ],
                ),
              ),
            if (events.isEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Text(
                  'Здесь появятся урон, лечение, броски и отдых этой сессии.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: p.muted),
                ),
              ),
            for (final event in events)
              _EventRow(
                event: describeEvent(event),
                time: relativeTime(event.createdAt),
                pending: event.pending,
              ),
            if (view.hasMoreEvents)
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: OutlinedButton(
                  onPressed: () =>
                      context.read<SessionCubit>().loadMoreEvents(),
                  child: const Text('Показать раньше'),
                ),
              ),
          ],
        );
      },
    );
  }

  static String _actions(int count) {
    final mod10 = count % 10, mod100 = count % 100;
    final word = mod10 == 1 && mod100 != 11
        ? 'действие'
        : mod10 >= 2 && mod10 <= 4 && (mod100 < 12 || mod100 > 14)
            ? 'действия'
            : 'действий';
    return '$count $word';
  }
}

class _EventRow extends StatelessWidget {
  final ({IconData icon, String title, String details}) event;
  final String time;
  final bool pending;

  const _EventRow(
      {required this.event, required this.time, required this.pending});

  @override
  Widget build(BuildContext context) {
    final p = DndPalette.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration:
          BoxDecoration(border: Border(bottom: BorderSide(color: p.line))),
      child: Opacity(
        opacity: pending ? 0.8 : 1,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 36,
              height: 36,
              decoration:
                  BoxDecoration(color: p.raised, shape: BoxShape.circle),
              child: Icon(
                pending ? Icons.schedule : event.icon,
                size: 18,
                color: pending ? p.muted : p.gold,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    event.title,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  if (pending || event.details.isNotEmpty) ...[
                    const SizedBox(height: 2),
                    Text(
                      pending ? 'Ждёт отправки' : event.details,
                      style: TextStyle(
                        fontSize: 14,
                        color: pending ? p.gold : p.muted,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            const SizedBox(width: 8),
            Text(time, style: TextStyle(fontSize: 13, color: p.muted)),
          ],
        ),
      ),
    );
  }
}
