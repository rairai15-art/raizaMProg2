import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _darkMode = false;
  bool _notifications = true;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text('App Settings')),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 28),
        children: [
          const Text(
            'Make it yours',
            style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.w800,
              color: Color(0xFF172B2A),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            'Tune your workspace to fit the way you work.',
            style: TextStyle(color: colors.onSurfaceVariant, fontSize: 14),
          ),
          const SizedBox(height: 20),
          const _SettingsGroupHeading('PREFERENCES'),
          const SizedBox(height: 10),
          Card(
            child: Column(
              children: [
                SwitchListTile(
                  secondary: const _SettingsIcon(
                    icon: Icons.dark_mode_outlined,
                    color: Color(0xFF5557A8),
                    background: Color(0xFFE6E8FF),
                  ),
                  title: const Text(
                    'Dark Mode',
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                  subtitle: const Text('Enable mock dark theme'),
                  value: _darkMode,
                  activeTrackColor: colors.primary,
                  onChanged: (value) => setState(() => _darkMode = value),
                ),
                Divider(height: 1, indent: 72, color: colors.outlineVariant),
                SwitchListTile(
                  secondary: const _SettingsIcon(
                    icon: Icons.notifications_outlined,
                    color: Color(0xFFAF6A13),
                    background: Color(0xFFFFEFD8),
                  ),
                  title: const Text(
                    'Notifications',
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                  subtitle: const Text('Enable mock alerts'),
                  value: _notifications,
                  activeTrackColor: colors.primary,
                  onChanged: (value) => setState(() => _notifications = value),
                ),
              ],
            ),
          ),
          const SizedBox(height: 22),
          const _SettingsGroupHeading('ABOUT'),
          const SizedBox(height: 10),
          Card(
            child: Column(
              children: [
                ListTile(
                  leading: const _SettingsIcon(
                    icon: Icons.language_rounded,
                    color: Color(0xFF0B766E),
                    background: Color(0xFFDBF3ED),
                  ),
                  title: const Text(
                    'Language',
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                  subtitle: const Text('English'),
                  trailing: const Icon(Icons.chevron_right_rounded),
                ),
                Divider(height: 1, indent: 72, color: colors.outlineVariant),
                const ListTile(
                  leading: _SettingsIcon(
                    icon: Icons.info_outline_rounded,
                    color: Color(0xFF455D69),
                    background: Color(0xFFE8EEF0),
                  ),
                  title: Text(
                    'Version',
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                  subtitle: Text('1.0.0 (Mock)'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 22),
          const Center(
            child: Text(
              'NORTHSTAR  ·  MADE FOR MOMENTUM',
              style: TextStyle(
                color: Color(0xFF83918F),
                fontSize: 10,
                fontWeight: FontWeight.w700,
                letterSpacing: 1.1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SettingsGroupHeading extends StatelessWidget {
  final String title;

  const _SettingsGroupHeading(this.title);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        color: Color(0xFF74817F),
        fontSize: 11,
        fontWeight: FontWeight.w800,
        letterSpacing: 1.2,
      ),
    );
  }
}

class _SettingsIcon extends StatelessWidget {
  final IconData icon;
  final Color color;
  final Color background;

  const _SettingsIcon({
    required this.icon,
    required this.color,
    required this.background,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: background,
      child: Icon(icon, color: color, size: 20),
    );
  }
}
