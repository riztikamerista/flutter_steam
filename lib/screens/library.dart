import 'package:flutter/material.dart';

class LibraryPage extends StatefulWidget {
  const LibraryPage({Key? key}) : super(key: key);

  @override
  State<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  // Data untuk game library
  final List<Map<String, dynamic>> games = [
    {
      'title': 'THE LAST OF US',
      'subtitle': 'PART II',
      'imageUrl':
          'https://images.unsplash.com/photo-1552820728-8b83bb6b773f?w=400',
      'logoUrl':
          'https://images.unsplash.com/photo-1552820728-8b83bb6b773f?w=100',
    },
    {
      'title': 'SILENT HILL 2',
      'subtitle': '',
      'imageUrl':
          'https://images.unsplash.com/photo-1509347528160-9a9e33742cdb?w=400',
      'logoUrl':
          'https://images.unsplash.com/photo-1509347528160-9a9e33742cdb?w=100',
    },
    {
      'title': 'VILLAGE',
      'subtitle': 'RESIDENT EVIL',
      'imageUrl':
          'https://images.unsplash.com/photo-1511512578047-dfb367046420?w=400',
      'logoUrl':
          'https://images.unsplash.com/photo-1511512578047-dfb367046420?w=100',
    },
    {
      'title': 'RESIDENT EVIL',
      'subtitle': 'BIOHAZARD',
      'imageUrl':
          'https://images.unsplash.com/photo-1509198397868-475647b2a1e5?w=400',
      'logoUrl':
          'https://images.unsplash.com/photo-1509198397868-475647b2a1e5?w=100',
    },
    {
      'title': 'RESIDENT EVIL 4',
      'subtitle': '',
      'imageUrl':
          'https://images.unsplash.com/photo-1556438064-2d7646166914?w=400',
      'logoUrl':
          'https://images.unsplash.com/photo-1556438064-2d7646166914?w=100',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1B2838),
      body: SafeArea(
        child: Column(
          children: [
            // Header
            _buildHeader(),

            // Game List
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                itemCount: games.length,
                itemBuilder: (context, index) {
                  return _buildGameItem(games[index]);
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      color: const Color(0xFF171A21),
      child: Row(
        children: [
          // Back Button
          IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),

          const SizedBox(width: 16),

          // Steam Logo
          Image.asset(
            'assets/images/steam.png',
            height: 20,
            errorBuilder: (context, error, stackTrace) {
              return const Icon(
                Icons.videogame_asset,
                color: Colors.white,
                size: 20,
              );
            },
          ),
          const SizedBox(width: 8),
          const Text(
            'STEAM',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGameItem(Map<String, dynamic> game) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      height: 100,
      decoration: BoxDecoration(
        color: const Color(0xFF0E1419),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        children: [
          // Game Image/Background
          Expanded(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(4),
                  bottomLeft: Radius.circular(4),
                ),
                image: DecorationImage(
                  image: NetworkImage(game['imageUrl']),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(4),
                    bottomLeft: Radius.circular(4),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [Colors.black.withOpacity(0.3), Colors.transparent],
                  ),
                ),
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      game['title'],
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            color: Colors.black,
                            offset: Offset(1, 1),
                            blurRadius: 3,
                          ),
                        ],
                      ),
                    ),
                    if (game['subtitle'].isNotEmpty) ...[
                      const SizedBox(height: 2),
                      Text(
                        game['subtitle'],
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.9),
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          shadows: const [
                            Shadow(
                              color: Colors.black,
                              offset: Offset(1, 1),
                              blurRadius: 3,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),

          // Game Logo/Icon di kanan
          Container(
            width: 80,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(4),
                bottomRight: Radius.circular(4),
              ),
              image: DecorationImage(
                image: NetworkImage(game['logoUrl']),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(4),
                  bottomRight: Radius.circular(4),
                ),
                color: Colors.black.withOpacity(0.3),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF171A21),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: BottomNavigationBar(
        backgroundColor: const Color(0xFF171A21),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white54,
        type: BottomNavigationBarType.fixed,
        currentIndex: 1,
        onTap: (index) {
          if (index == 0) {
            Navigator.pop(context);
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(
            icon: Icon(Icons.widgets_outlined),
            label: '',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.qr_code_scanner), label: ''),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: '',
          ),
        ],
      ),
    );
  }
}
