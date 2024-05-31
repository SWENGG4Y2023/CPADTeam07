class GlobalData {
  static String? userId;
  static String? fullName;
  static String? email;

  // Private constructor to prevent instantiation
  GlobalData._();

  // Method to initialize global data and set all fields
  static void initialize({
    String? email,
    String? fullName,
    String? userId
  }) {
    // Initialize other global data properties here
    GlobalData.userId = userId ?? "6ahxNtjikFQ8GTOowPaOBcPfRMk1";
    GlobalData.email = email ?? "prashita@gmail.com";
    GlobalData.fullName = fullName ?? "Prashita Khunteta";
    
  }
}
