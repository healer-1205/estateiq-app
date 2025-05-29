import 'package:estate_iq/presentation/screens/home_screen.dart';
import 'package:estate_iq/presentation/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

Future<void> _loadEnvironmentFile() async {
  try {
    await dotenv.load(fileName: '.env');
  } catch (e) {
    debugPrint('Error loading .env file: $e');
    // Provide a fallback or handle error as needed
  }
}

void main() async {
  // Ensure that the Flutter engine is initialized before loading the environment file
  WidgetsFlutterBinding.ensureInitialized();
  await _loadEnvironmentFile();

  // Initialize shared preferences
  final prefs = await SharedPreferences.getInstance();
  final showOnboarding = !(prefs.getBool('onboarding_complete') ?? false);
  runApp(
    ChangeNotifierProvider(
      create: (_) => OnboardingProvider(showOnboarding, prefs),
      child: const MainApp(),
    ),
  );
}

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

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Consumer<OnboardingProvider>(
        builder: (context, onboardingProvider, child) {
          if (onboardingProvider.showOnboarding) {
            return OnboardingScreen();
          } else {
            return HomeScreen();
          }
        },
      ),
    );
  }
}
