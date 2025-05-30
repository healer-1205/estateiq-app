import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  bool _obscurePassword = true;
  bool _agreeTerms = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocus.dispose();
    _passwordFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color(0xFFEFF3F6),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Stack(
              children: [
                // Green Header
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  height: constraints.maxHeight * 0.23,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color(0xFF179C6C),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(0),
                        topRight: Radius.circular(0),
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(0),
                      ),
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      'EstateIQ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ),
                // White Card with scroll
                Positioned(
                  top: constraints.maxHeight * 0.13,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Center(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: 370,
                        minWidth: 0,
                        maxHeight: constraints.maxHeight * 0.87,
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 16),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 32,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 10,
                                offset: Offset(0, 4),
                              ),
                            ],
                          ),
                          child: SingleChildScrollView(
                            physics: const ClampingScrollPhysics(),
                            child: _buildForm(context),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildForm(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'Welcome Back',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1B2B48),
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Log In to access your saved searches, \nproperties and much more',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 13, color: Color(0xFF8A97A8)),
        ),
        const SizedBox(height: 32),
        // Email Field
        TextField(
          controller: _emailController,
          focusNode: _emailFocus,
          decoration: InputDecoration(
            prefixIcon: const Icon(
              Icons.email_outlined,
              color: Color(0xFF8A97A8),
            ),
            hintText: 'Enter Email',
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(vertical: 18),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
            ),
          ),
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          onEditingComplete: () {
            FocusScope.of(context).requestFocus(_passwordFocus);
          },
        ),
        const SizedBox(height: 16),
        // Password Field
        TextField(
          controller: _passwordController,
          focusNode: _passwordFocus,
          obscureText: _obscurePassword,
          decoration: InputDecoration(
            prefixIcon: const Icon(
              Icons.lock_outline,
              color: Color(0xFF8A97A8),
            ),
            hintText: 'enter Password',
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(vertical: 18),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
            ),
            suffixIcon: IconButton(
              icon: Icon(
                _obscurePassword ? Icons.visibility_off : Icons.visibility,
                color: const Color(0xFF8A97A8),
              ),
              onPressed: () {
                setState(() {
                  _obscurePassword = !_obscurePassword;
                });
              },
            ),
          ),
          textInputAction: TextInputAction.done,
        ),
        const SizedBox(height: 8),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {},
            child: const Text(
              'FORGOT PASSWORD?',
              style: TextStyle(
                color: Color(0xFF1B2B48),
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(child: Divider()),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                'OR',
                style: TextStyle(
                  color: Color(0xFF8A97A8),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Expanded(child: Divider()),
          ],
        ),
        const SizedBox(height: 16),
        // Social Buttons
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _SocialSvgIconButton(
              assetPath: 'assets/images/google-icon.svg',
              onTap: () {},
            ),
            _SocialSvgIconButton(
              assetPath: 'assets/images/facebook-icon.svg',
              onTap: () {},
            ),
            _SocialSvgIconButton(
              assetPath: 'assets/images/x-icon.svg',
              onTap: () {},
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Checkbox(
              value: _agreeTerms,
              onChanged: (val) {
                setState(() {
                  _agreeTerms = val ?? false;
                });
              },
              activeColor: const Color(0xFF179C6C),
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            Expanded(
              child: RichText(
                text: TextSpan(
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF8A97A8),
                  ),
                  children: [
                    const TextSpan(text: 'I agree to the '),
                    TextSpan(
                      text: 'TERMS OF SERVICES',
                      style: const TextStyle(
                        color: Color(0xFF179C6C),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const TextSpan(text: ' and '),
                    TextSpan(
                      text: 'PRIVACY POLICY',
                      style: const TextStyle(
                        color: Color(0xFF179C6C),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const TextSpan(text: ' of Outsidr'),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        // Log In Button
        ElevatedButton(
          onPressed: _agreeTerms ? () {} : null,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF179C6C),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            padding: const EdgeInsets.symmetric(vertical: 16),
            textStyle: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          child: const Text('Log In', style: TextStyle(color: Colors.white)),
        ),
        const SizedBox(height: 16),
        Center(
          child: RichText(
            text: TextSpan(
              style: const TextStyle(color: Color(0xFF8A97A8), fontSize: 13),
              children: [
                const TextSpan(text: "You don't have account Signup ? "),
                TextSpan(
                  text: 'Sign up',
                  style: const TextStyle(
                    color: Color(0xFF179C6C),
                    fontWeight: FontWeight.bold,
                  ),
                  // recognizer: TapGestureRecognizer()..onTap = () {}, // Add navigation if needed
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _SocialSvgIconButton extends StatelessWidget {
  final String assetPath;
  final VoidCallback onTap;

  const _SocialSvgIconButton({required this.assetPath, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: const ShapeDecoration(
        color: Color(0xFFF5F6FA),
        shape: CircleBorder(),
      ),
      child: IconButton(
        onPressed: onTap,
        icon: SvgPicture.asset(assetPath, width: 28, height: 28),
        splashRadius: 28,
      ),
    );
  }
}
