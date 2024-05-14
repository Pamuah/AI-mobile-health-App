import 'package:flutter/material.dart';

class AiModelScreen extends StatefulWidget {
  static const routeName = '/ai-model';
  const AiModelScreen({super.key});

  @override
  State<AiModelScreen> createState() => _AiModelScreenState();
}

class _AiModelScreenState extends State<AiModelScreen> {
  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: color.secondary,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        toolbarHeight: 70,
        centerTitle: true,
        title: RichText(
          text: TextSpan(
            style: TextStyle(
                color: color.onPrimary,
                fontSize: 30,
                fontWeight: FontWeight.bold),
            children: <TextSpan>[
              const TextSpan(
                text: 'Health ',
              ),
              TextSpan(text: 'AI', style: TextStyle(color: color.primary)),
            ],
          ),
        ),
        leading: Container(
          height: 55,
          width: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color.primary,
          ),
          child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(
                Icons.arrow_back_ios,
                size: 24,
                color: color.onPrimary,
              )),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.hardEdge,
              children: [
                Container(
                  height: 200,
                  width: 270,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: color.primary,
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  child: Image.asset(
                    'assets/robo_image.png',
                    height: 220,
                    width: 250,
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12.0, bottom: 90.0),
              child: RichText(
                text: TextSpan(
                  style: TextStyle(
                      color: color.onPrimary,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                  children: <TextSpan>[
                    const TextSpan(
                      text: 'Welcome, ',
                    ),
                    TextSpan(
                        text: 'I am your AI Assistant',
                        style: TextStyle(color: color.onPrimary)),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25.0),
              child: SizedBox(
                //  height: 90,
                width: MediaQuery.of(context).size.width,
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(20),
                    border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: color.secondary, width: 2.0),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    hintText: 'Enter your Symptoms here',
                    hintStyle: TextStyle(
                        fontSize: 24,
                        color: color.tertiary,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
