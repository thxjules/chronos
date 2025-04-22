class Session {
  static Map<String, dynamic>? currentUser;

  static void login(Map<String, dynamic> userData) {
    currentUser = userData;
  }

  static void logout() {
    currentUser = null;
  }

  static String get username => currentUser?['username'] ?? 'Explorador';
}
