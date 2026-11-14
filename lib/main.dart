
import 'package:flutter/material.dart';

// ==================== MAIN ====================

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

// ==================== MENU PRINCIPALE ====================

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("TP6 Flutter")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Les exercices Flutter",
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Ex1()));
              },
              child: const Text("Exercice 1"),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Ex2()));
              },
              child: const Text("Exercice 2"),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Ex3()));
              },
              child: const Text("Exercice 3"),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Ex4()));
              },
              child: const Text("Exercice 4"),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Ex5()));
              },
              child: const Text("Exercice 5"),
            ),
          ],
        ),
      ),
    );
  }
}

// ==================== EXERCICE 1 ====================
// Afficher un texte

class Ex1 extends StatelessWidget {
  const Ex1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Exercice 1")),
      body: const Center(
        child: Text(
          "Bonjour GTIC L3 !",
          style: TextStyle(fontSize: 22),
        ),
      ),
    );
  }
}

// ==================== EXERCICE 2 ====================
// Column + Text + ElevatedButton + SnackBar

class Ex2 extends StatelessWidget {
  const Ex2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Exercice 2")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Bienvenue dans l'atelier Flutter"),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Bouton cliqué !"),
                  ),
                );
              },
              child: const Text("Afficher un message"),
            ),
          ],
        ),
      ),
    );
  }
}

// ==================== EXERCICE 3 ====================
// StatefulWidget + setState()

class Ex3 extends StatefulWidget {
  const Ex3({super.key});

  @override
  State<Ex3> createState() => _Ex3State();
}

class _Ex3State extends State<Ex3> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Exercice 3")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Compteur : $count",
              style: const TextStyle(fontSize: 26),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () => setState(() => count++),
              child: const Text("Augmenter"),
            ),

            ElevatedButton(
              onPressed: () => setState(() => count = 0),
              child: const Text("Réinitialiser"),
            ),
          ],
        ),
      ),
    );
  }
}

// ==================== EXERCICE 4 ====================
// TextField + TextEditingController

class Ex4 extends StatefulWidget {
  const Ex4({super.key});

  @override
  State<Ex4> createState() => _Ex4State();
}

class _Ex4State extends State<Ex4> {
  final controller = TextEditingController();
  String message = "";

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Exercice 4")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                labelText: "Votre nom",
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                setState(() {
                  message = "Bonjour ${controller.text}";
                });
              },
              child: const Text("Afficher"),
            ),

            const SizedBox(height: 20),

            Text(
              message,
              style: const TextStyle(fontSize: 22),
            ),
          ],
        ),
      ),
    );
  }
}

// ==================== EXERCICE 5 ====================
// ListView.builder + ListTile

class Ex5 extends StatelessWidget {
  const Ex5({super.key});

  final List<String> items = const [
    "Cours Flutter",
    "Cours UML",
    "Atelier Mobile",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("ListView")),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(items[index]),
            leading: const Icon(Icons.book),
          );
        },
      ),
    );
  }
}
