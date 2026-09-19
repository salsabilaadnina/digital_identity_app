import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

void main() {
  runApp(const DigitalIdentityApp());
}

class DigitalIdentityApp extends StatelessWidget {
  const DigitalIdentityApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Digital Identity',
      home: const ProfilePage(),
    );
  }
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late VideoPlayerController _videoController;

  @override
  void initState() {
    super.initState();

    _videoController = VideoPlayerController.asset(
      'assets/videos/video.mp4',
    )..initialize().then((_) {
        if (mounted) {
          setState(() {});
        }
      });
  }

  @override
  void dispose() {
    _videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF0D47A1),
              Color(0xFF1976D2),
              Color(0xFF42A5F5),
              Color(0xFF81D4FA),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 30),

                // PROFILE
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white,
                      width: 5,
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 15,
                        offset: Offset(0, 6),
                      ),
                    ],
                  ),
                  child: const CircleAvatar(
                    radius: 65,
                    backgroundImage:
                        AssetImage('assets/images/profil.jpg'),
                  ),
                ),

                const SizedBox(height: 18),

                const Text(
                  'Salsabila Adnina Hadi',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 8),

                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 7,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white24,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    '2411022 • Informatika',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),

                const SizedBox(height: 35),

                // ABOUT ME
                _card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _sectionTitle(
                        Icons.person,
                        'About Me',
                      ),
                      const SizedBox(height: 14),
                      const Text(
                        'Halo! Saya Salsabila Adnina Hadi, '
                        'mahasiswa Informatika yang tertarik '
                        'dengan teknologi, desain, dan pengembangan aplikasi.',
                        style: TextStyle(
                          fontSize: 15,
                          height: 1.6,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // SKILLS
                _card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _sectionTitle(
                        Icons.star,
                        'My Skills',
                      ),
                      const SizedBox(height: 18),
                      Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: [
                          _skillChip(
                            Icons.flutter_dash,
                            'Flutter',
                          ),
                          _skillChip(
                            Icons.code,
                            'Dart',
                          ),
                          _skillChip(
                            Icons.design_services,
                            'UI/UX Design',
                          ),
                          _skillChip(
                            Icons.web,
                            'HTML & CSS',
                          ),
                          _skillChip(
                            Icons.storage,
                            'Database',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // VIDEO
                _card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _sectionTitle(
                        Icons.play_circle_fill,
                        'Introduction Video',
                      ),
                      const SizedBox(height: 18),

                      if (_videoController.value.isInitialized)
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: AspectRatio(
                            aspectRatio:
                                _videoController.value.aspectRatio,
                            child: VideoPlayer(
                              _videoController,
                            ),
                          ),
                        )
                      else
                        Container(
                          height: 250,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),

                      const SizedBox(height: 12),

                      if (_videoController.value.isInitialized)
                        Center(
                          child: IconButton(
                            iconSize: 50,
                            onPressed: () {
                              setState(() {
                                if (_videoController
                                    .value
                                    .isPlaying) {
                                  _videoController.pause();
                                } else {
                                  _videoController.play();
                                }
                              });
                            },
                            icon: Icon(
                              _videoController.value.isPlaying
                                  ? Icons.pause_circle
                                  : Icons.play_circle,
                              color: const Color(0xFF1565C0),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // CONTACT
                _card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _sectionTitle(
                        Icons.contact_mail,
                        'Contact Me',
                      ),
                      const SizedBox(height: 18),

                      _contactItem(
                        Icons.email,
                        'salsabilaadnina@gmail.com',
                      ),

                      const SizedBox(height: 15),

                      _contactItem(
                        Icons.camera_alt,
                        '@salsabilaadnina',
                      ),

                      const SizedBox(height: 15),

                      _contactItem(
                        Icons.code,
                        'github.com/salsabilaadnina',
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                const Text(
                  '🌊  Made with Flutter  🌊',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                const SizedBox(height: 8),

                const Padding(
                  padding: EdgeInsets.only(bottom: 25),
                  child: Text(
                    '© 2026 Salsabila Adnina Hadi\n'
                    'My Digital Identity',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 13,
                      height: 1.5,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // SECTION TITLE
  static Widget _sectionTitle(
    IconData icon,
    String title,
  ) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: const Color(0xFFE3F2FD),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            icon,
            color: const Color(0xFF1565C0),
          ),
        ),
        const SizedBox(width: 10),
        Text(
          title,
          style: const TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1565C0),
          ),
        ),
      ],
    );
  }

  // CARD
  static Widget _card({
    required Widget child,
  }) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 25),
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 12,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: child,
    );
  }

  // SKILL CHIP
  static Widget _skillChip(
    IconData icon,
    String skill,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFE3F2FD),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 18,
            color: const Color(0xFF1565C0),
          ),
          const SizedBox(width: 7),
          Text(
            skill,
            style: const TextStyle(
              color: Color(0xFF1565C0),
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  // CONTACT ITEM
  static Widget _contactItem(
    IconData icon,
    String text,
  ) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(9),
          decoration: BoxDecoration(
            color: const Color(0xFFE3F2FD),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            icon,
            color: const Color(0xFF1565C0),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 15,
            ),
          ),
        ),
      ],
    );
  }
}