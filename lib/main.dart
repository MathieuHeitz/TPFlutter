import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// Widget racine de l'app
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Carte Utilisateur Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Widget personnalisé')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Exemple d'utilisation de CarteUtilisateur
            CarteUtilisateur(
              avatar: const CircleAvatar(
                backgroundImage: NetworkImage('https://i.pravatar.cc/150'),
                radius: 30,
              ),
              name: 'Marie Dubois',
              role: 'Développeuse Flutter',
              note: 4.5,
              button: LikeButton(
                onLikeChanged: (likes) {
                  debugPrint('Nombre de likes: $likes');
                },
              ),
            ),
            const SizedBox(height: 20),
            // Un autre exemple pour montrer la réutilisabilité
            CarteUtilisateur(
              avatar: const CircleAvatar(
                backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=3'),
                radius: 30,
              ),
              name: 'Thomas Martin',
              role: 'Designer UX/UI',
              note: 4.8,
              button: LikeButton(
                onLikeChanged: (likes) {
                  debugPrint('Nombre de likes: $likes');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CarteUtilisateur extends StatelessWidget {
  final Widget avatar;
  final String name;
  final String role;
  final double note;
  final LikeButton button;

  const CarteUtilisateur({
    super.key,
    required this.avatar,
    required this.name,
    required this.role,
    required this.note,
    required this.button,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(12),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                // Avatar
                avatar,
                const SizedBox(width: 16),
                // Informations utilisateur
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        role,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Note
            Row(
              children: [
                const Icon(Icons.star, color: Colors.amber),
                const SizedBox(width: 8),
                Text(
                  '$note/5',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                // Bouton Like
                button,
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class LikeButton extends StatefulWidget {
  final Function(int)? onLikeChanged;

  const LikeButton({
    super.key,
    this.onLikeChanged,
  });

  @override
  State<LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  int _likeCount = 0;

  @override
  Widget build(BuildContext context) {
    // Changer la couleur après 5 likes
    final buttonColor = _likeCount >= 5 ? Colors.red : Colors.blue;

    return ElevatedButton(
      onPressed: () {
        setState(() {
          _likeCount++;
        });
        if (widget.onLikeChanged != null) {
          widget.onLikeChanged!(_likeCount);
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Text('Like ($_likeCount)'),
    );
  }
}
