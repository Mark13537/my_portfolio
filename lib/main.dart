import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Spacer(),
            Text(
              'Moshi moshi! Portfolio is under construction.',
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.03),
            ),
            const Icon(Icons.construction),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    onPressed: () async {
                      final Uri url =
                          Uri.parse('https://www.linkedin.com/in/desai-mitul/');
                      await launchUrl(url,
                          mode: LaunchMode.externalApplication);
                    },
                    icon: const Icon(
                      FontAwesomeIcons.linkedin,
                      size: 30,
                    )),
                IconButton(
                    onPressed: () async {
                      final Uri url = Uri.parse('https://github.com/Mark13537');
                      await launchUrl(url);
                    },
                    icon: const Icon(
                      FontAwesomeIcons.github,
                      size: 30,
                    )),
                IconButton(
                    onPressed: () async {
                      final Uri url =
                          Uri.parse('mailto:mitul.desai@outlook.com');
                      await launchUrl(url);
                    },
                    icon: const Icon(
                      Icons.email,
                      size: 30,
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
