import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mitul Desai',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final welomeTxt =
      'Konnichiwa! I\'m Mitul Desai, 5 years experienced mobile app developer. Aspiring to advance as an Application Architect with comprehensive knowledge of clean coding practices, data structures and algorithms.\nPortfolio is under construction.';

  @override
  void initState() {
    super.initState();
    FirebaseAnalytics.instance.logEvent(name: 'Launching portfolio');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Spacer(),
            Text(
              welomeTxt,
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.04),
            ),
            const Icon(
              Icons.construction,
              size: 30,
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildSocialBtn(
                  urlStr: 'https://www.linkedin.com/in/desai-mitul/',
                  icon: FontAwesomeIcons.linkedin,
                ),
                buildSocialBtn(
                  urlStr: 'https://github.com/Mark13537',
                  icon: FontAwesomeIcons.github,
                ),
                buildSocialBtn(
                  urlStr: 'mailto:mitul.desai@outlook.com',
                  icon: Icons.email,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  IconButton buildSocialBtn({
    required final String urlStr,
    required final IconData icon,
  }) {
    return IconButton(
      onPressed: () async {
        final Uri url = Uri.parse(urlStr);
        await launchUrl(url, mode: LaunchMode.externalApplication);
      },
      icon: Icon(
        icon,
        size: 30,
      ),
    );
  }
}
