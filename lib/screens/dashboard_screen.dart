import 'package:flutter/material.dart';
import '../models/app_data.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard Overview'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 18),
            child: CircleAvatar(
              radius: 19,
              backgroundColor: colors.primaryContainer,
              child: Icon(Icons.person_rounded, color: colors.primary, size: 21),
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 28),
        children: [
          Container(
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF123C43), Color(0xFF0B766E)],
              ),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'YOUR DAY AT A GLANCE',
                  style: TextStyle(
                    color: Color(0xFF9CE7D5),
                    fontSize: 11,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 1.4,
                  ),
                ),
                SizedBox(height: 13),
                Text(
                  'Hello, Raiza 👋',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: 7),
                Text(
                  'Here’s a snapshot of what’s moving today.',
                  style: TextStyle(color: Color(0xFFD6E9E5), fontSize: 14),
                ),
                SizedBox(height: 19),
                Row(
                  children: [
                    Icon(
                      Icons.auto_awesome_rounded,
                      color: Color(0xFF9CE7D5),
                      size: 17,
                    ),
                    SizedBox(width: 8),
                    Text(
                      'You’re right on track',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 26),
          const _SectionHeading(
            title: 'Your workspace',
            subtitle: 'The numbers at a glance',
          ),
          const SizedBox(height: 14),
          Row(
            children: List.generate(MockStat.mockStats.length, (index) {
              final stat = MockStat.mockStats[index];
              final icon = switch (index) {
                0 => Icons.folder_copy_outlined,
                1 => Icons.task_alt_rounded,
                _ => Icons.chat_bubble_outline_rounded,
              };
              final tint = switch (index) {
                0 => const Color(0xFFDBF3ED),
                1 => const Color(0xFFFFEFD8),
                _ => const Color(0xFFE6E8FF),
              };
              final ink = switch (index) {
                0 => const Color(0xFF0B766E),
                1 => const Color(0xFFAF6A13),
                _ => const Color(0xFF5557A8),
              };

              return Expanded(
                child: Padding(
                  padding: EdgeInsets.only(right: index == 2 ? 0 : 10),
                  child: _StatCard(
                    title: stat.title,
                    value: stat.value,
                    icon: icon,
                    tint: tint,
                    ink: ink,
                  ),
                ),
              );
            }),
          ),
          const SizedBox(height: 27),
          const _SectionHeading(
            title: 'Recent activity',
            subtitle: 'A little progress goes a long way',
          ),
          const SizedBox(height: 14),
          Card(
            child: Column(
              children: [
                _ActivityTile(
                  icon: Icons.check_rounded,
                  color: const Color(0xFF0B766E),
                  title: 'Setup Navigation',
                  detail: 'Completed',
                  time: 'Today',
                ),
                Divider(height: 1, indent: 68, color: colors.outlineVariant),
                _ActivityTile(
                  icon: Icons.more_horiz_rounded,
                  color: const Color(0xFFAF6A13),
                  title: 'Design Mock Screens',
                  detail: 'In progress',
                  time: 'Today',
                ),
                Divider(height: 1, indent: 68, color: colors.outlineVariant),
                _ActivityTile(
                  icon: Icons.description_outlined,
                  color: const Color(0xFF5557A8),
                  title: 'Hardcoded Data',
                  detail: 'Static review ready',
                  time: 'Yesterday',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionHeading extends StatelessWidget {
  final String title;
  final String subtitle;

  const _SectionHeading({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w800,
            color: Color(0xFF172B2A),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          subtitle,
          style: TextStyle(
            fontSize: 13,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color tint;
  final Color ink;

  const _StatCard({
    required this.title,
    required this.value,
    required this.icon,
    required this.tint,
    required this.ink,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 34,
              height: 34,
              decoration: BoxDecoration(
                color: tint,
                borderRadius: BorderRadius.circular(11),
              ),
              child: Icon(icon, color: ink, size: 18),
            ),
            const SizedBox(height: 14),
            Text(
              value,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w800,
                color: Color(0xFF172B2A),
              ),
            ),
            const SizedBox(height: 2),
            Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Color(0xFF74817F),
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ActivityTile extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String title;
  final String detail;
  final String time;

  const _ActivityTile({
    required this.icon,
    required this.color,
    required this.title,
    required this.detail,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      leading: CircleAvatar(
        backgroundColor: color.withValues(alpha: 0.1),
        child: Icon(icon, color: color, size: 20),
      ),
      title: Text(
        'Task: $title',
        style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
      ),
      subtitle: Text(detail),
      trailing: Text(
        time,
        style: const TextStyle(color: Color(0xFF83918F), fontSize: 12),
      ),
    );
  }
}
