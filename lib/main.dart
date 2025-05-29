import 'package:estate_iq/presentation/screens/splash_screen.dart'; // <-- Add this import
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> _loadEnvironmentFile() async {
  try {
    await dotenv.load(fileName: '.env');
  } catch (e) {
    debugPrint('Error loading .env file: $e');
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _loadEnvironmentFile();

  runApp(
    const MainApp(),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
    );
  }
}

// Move onboarding logic to SplashScreen
class OnboardingProvider extends ChangeNotifier {
  bool _showOnboarding;
  final SharedPreferences _prefs;

  OnboardingProvider(this._showOnboarding, this._prefs);

  bool get showOnboarding => _showOnboarding;

  void completeOnboarding() {
    _showOnboarding = false;
    _prefs.setBool('onboarding_complete', true);
    notifyListeners();
  }
}
