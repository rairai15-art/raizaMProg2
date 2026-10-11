class UserProfile {
  final String name;
  final String role;
  final String email;
  final String phone;
  final String bio;

  const UserProfile({
    required this.name,
    required this.role,
    required this.email,
    required this.phone,
    required this.bio,
  });

  static const UserProfile mock = UserProfile(
    name: 'Raiza',
    role: 'Workspace Administrator',
    email: 'raiza123@navigations.app',
    phone: '+1 (555) 234-5678',
    bio: 'Keeping projects focused and moving forward.',
  );
}

class MockStat {
  final String title;
  final String value;

  const MockStat({
    required this.title,
    required this.value,
  });

  static const List<MockStat> mockStats = [
    MockStat(title: 'Projects', value: '12'),
    MockStat(title: 'Tasks', value: '5'),
    MockStat(title: 'Messages', value: '3'),
  ];
}
