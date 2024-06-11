import 'package:ai_mhealth_app/Screens/notifications.dart';
import 'package:ai_mhealth_app/Screens/settings.dart';
import 'package:ai_mhealth_app/widgets/shortcut_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
        child: GNav(
          tabBackgroundColor: color.primary,
          padding: const EdgeInsets.all(16),
          gap: 8.0,
          iconSize: 33,
          tabs: [
            GButton(
              icon: Icons.home,
              iconSize: 30,
              text: 'Home',
              style: GnavStyle.oldSchool,
              textColor: color.secondary,
            ),
            GButton(
              icon: Icons.notification_important,
              iconSize: 30,
              text: 'Notification',
              textColor: color.secondary,
            ),
            GButton(
              icon: Icons.settings,
              iconSize: 30,
              text: 'Settings',
              textColor: color.secondary,
            ),
          ],
          onTabChange: (index) {
            setState(() {
              currentIndex = index;
              print("$index");
            });
            controller.jumpToPage(index);
          },
        ),
      ),
      body: PageView.builder(
        onPageChanged: (page) {
          setState(() {
            currentIndex = page;
          });
          print("$page");
        },
        controller: controller,
        itemBuilder: (context, position) {
          switch (position) {
            case 0:
              return const MainScreen();
            case 1:
              return const NotificationsScreen();
            case 2:
              return const SettingsScreen();
            default:
              return Container();
          }
        },
        itemCount: 3,
      ),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        leading: const SizedBox(),
        backgroundColor: Colors.transparent,
        title: Text(
          'Welcome To Health AI',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: color.secondary),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0, top: 16),
                  child: Container(
                    padding: const EdgeInsets.only(bottom: 15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromARGB(255, 235, 233, 233)),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.28,
                              width: MediaQuery.of(context).size.width,
                              decoration: ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    side: const BorderSide(width: 0.5)),
                                image: const DecorationImage(
                                  image: AssetImage('assets/sethoscope 4.jpg'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Check yourself with AI',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: color.secondary),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                      context,
                                      '/ai-model',
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: color.primary,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  child: Text(
                                    'Start',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: color.secondary),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Text(
                  'Explore',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: color.secondary),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromARGB(255, 235, 233, 233)),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 16.0, right: 16.0, top: 25, bottom: 90),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ShortCut(
                                  activity: 'Connect\nwith\nDoctor',
                                  imageName: 'assets/doctor.png',
                                  onTap: () {
                                    Navigator.pushNamed(
                                      context,
                                      '/doctor',
                                    );
                                  },
                                ),
                                ShortCut(
                                  activity: 'Meds\nAlert',
                                  imageName: 'assets/alarm.png',
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, '/health-reminder');
                                  },
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 16.0, right: 16.0, bottom: 25),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ShortCut(
                                  activity: 'Health\nEducation',
                                  imageName: 'assets/book.png',
                                  onTap: () {
                                    Navigator.pushNamed(
                                      context,
                                      '/health-education',
                                    );
                                  },
                                ),
                                ShortCut(
                                  activity: 'History',
                                  imageName: 'assets/history.png',
                                  onTap: () {
                                    Navigator.pushNamed(
                                      context,
                                      '/patient-history',
                                    );
                                  },
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
