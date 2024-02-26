import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:peminjam_perpustakaan_kelas_b/app/modules/login/views/login_view.dart';

class splashScreen extends StatelessWidget {
  const splashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(splash:
        Column(
          children: [
            Center(
              child: LottieBuilder.asset("assets/Lottie/Animation - 1708798774797.json"),
            )
          ],
        )
        , nextScreen: const LoginView());
  }
}
