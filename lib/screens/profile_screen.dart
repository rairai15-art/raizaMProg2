import 'package:flutter/material.dart';
import '../models/app_data.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  void _onLogout(BuildContext context) {
    Navigator.of(context).pushReplacementNamed('/login');
  }

  @override
  Widget build(BuildContext context) {
    const user = UserProfile.mock;
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 28),
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(24, 28, 24, 24),
            decoration: BoxDecoration(
              color: const Color(0xFF123C43),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0xFF73D7BC),
                      width: 2,
                    ),
                  ),
                  child: const CircleAvatar(
                    radius: 43,
                    backgroundColor: Color(0xFFDBF3ED),
                    child: Text(
                      'R',
                      style: TextStyle(
                        color: Color(0xFF0B766E),
                        fontSize: 34,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  user.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 23,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  user.role,
                  style: const TextStyle(
                    color: Color(0xFF9CE7D5),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 14),
                Text(
                  user.bio,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xFFD6E9E5),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 25),
          const Text(
            'Account details',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: Color(0xFF172B2A),
            ),
          ),
          const SizedBox(height: 13),
          Card(
            child: Column(
              children: [
                _ProfileDetail(
                  icon: Icons.alternate_email_rounded,
                  label: 'Username',
                  value: 'raiza123',
                ),
                Divider(height: 1, indent: 68, color: colors.outlineVariant),
                _ProfileDetail(
                  icon: Icons.email_outlined,
                  label: 'Email',
                  value: user.email,
                ),
                Divider(height: 1, indent: 68, color: colors.outlineVariant),
                _ProfileDetail(
                  icon: Icons.phone_outlined,
                  label: 'Phone',
                  value: user.phone,
                ),
              ],
            ),
          ),
          const SizedBox(height: 22),
          OutlinedButton.icon(
            key: const Key('profile_logout_button'),
            onPressed: () => _onLogout(context),
            icon: const Icon(Icons.logout_rounded),
            label: const Text('Log Out'),
            style: OutlinedButton.styleFrom(
              foregroundColor: const Color(0xFFB54747),
              side: const BorderSide(color: Color(0xFFE8CDCD)),
              padding: const EdgeInsets.symmetric(vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProfileDetail extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _ProfileDetail({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      leading: CircleAvatar(
        backgroundColor: const Color(0xFFDBF3ED),
        child: Icon(icon, color: const Color(0xFF0B766E), size: 20),
      ),
      title: Text(
        label,
        style: const TextStyle(fontSize: 12, color: Color(0xFF74817F)),
      ),
      subtitle: Text(
        value,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w700,
          color: Color(0xFF172B2A),
        ),
      ),
    );
  }
}
