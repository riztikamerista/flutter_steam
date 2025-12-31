import 'package:flutter/material.dart';
import '../widgets/game_card.dart';
import '../widgets/small_game_card.dart';
import '../widgets/wide_game_card.dart';
import '../widgets/genre_card.dart';
import 'guard.dart';
import 'library.dart';
import 'news.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();

  // Data untuk Featured Games
  final List<Map<String, dynamic>> featuredGames = [
    {
      'title': 'FINAL FANTASY VII REMAKE',
      'imagePath': 'assets/images/ffvii_remake.jpg',
      'price': 'Rp 347.400',
      'ratingText': '(Very Positive)',
      'discount': 40,
    },
    {
      'title': 'FINAL FANTASY VII REMAKE',
      'imagePath': 'assets/images/ffvii_remake.jpg',
      'price': 'Rp 347.400',
      'ratingText': '(Very Positive)',
      'discount': 40,
    },
    {
      'title': 'FINAL FANTASY VII REMAKE',
      'imagePath': 'assets/images/ffvii_remake.jpg',
      'price': 'Rp 347.400',
      'ratingText': '(Very Positive)',
      'discount': 40,
    },
  ];

  // Data untuk Genre
  final List<Map<String, dynamic>> genres = [
    {
      'title': 'To Play',
      'icon': Icons.play_arrow,
      'color': Colors.blue,
      'imageUrl':
          'https://images.unsplash.com/photo-1511512578047-dfb367046420?w=200',
    },
    {
      'title': 'Action',
      'icon': Icons.flash_on,
      'color': Colors.blue,
      'imageUrl':
          'https://images.unsplash.com/photo-1509198397868-475647b2a1e5?w=200',
    },
    {
      'title': 'Horror',
      'icon': Icons.warning,
      'color': Colors.purple,
      'imageUrl':
          'https://images.unsplash.com/photo-1509347528160-9a9e33742cdb?w=200',
    },
    {
      'title': 'Strategy',
      'icon': Icons.psychology,
      'color': Colors.blueGrey,
      'imageUrl':
          'https://images.unsplash.com/photo-1560253023-3ec5d502959f?w=200',
    },
    {
      'title': 'Sports',
      'icon': Icons.sports_basketball,
      'color': Colors.blue,
      'imageUrl':
          'https://images.unsplash.com/photo-1461896836934-ffe607ba8211?w=200',
    },
  ];

  // Data untuk Recommended By Community
  final List<Map<String, dynamic>> communityGames = [
    {
      'title': 'Uncharted: Legacy of...',
      'price': 'Rp 347.400',
      'imageUrl':
          'https://images.unsplash.com/photo-1556438064-2d7646166914?w=400',
    },
    {
      'title': 'SPIDER-MAN 2',
      'price': 'Rp 347.400',
      'imageUrl':
          'https://images.unsplash.com/photo-1509198397868-475647b2a1e5?w=400',
    },
    {
      'title': 'THE LAST OF US Part II',
      'price': 'Rp 347.400',
      'imageUrl':
          'https://images.unsplash.com/photo-1552820728-8b83bb6b773f?w=400',
    },
    {
      'title': 'Uncharted 4',
      'price': 'Rp 347.400',
      'imageUrl':
          'https://images.unsplash.com/photo-1556438064-2d7646166914?w=400',
    },
  ];

  // Data untuk Recommended Based on Games You Play (pertama)
  final List<Map<String, dynamic>> recommendedGames1 = [
    {
      'title': 'Persona 5 Royal',
      'price': 'Rp 347.400',
      'imageUrl':
          'https://images.unsplash.com/photo-1511512578047-dfb367046420?w=400',
    },
    {
      'title': 'UNCHARTED: Legacy',
      'price': 'Rp 347.400',
      'imageUrl':
          'https://images.unsplash.com/photo-1556438064-2d7646166914?w=400',
    },
    {
      'title': 'UNCHARTED 4',
      'price': 'Rp 347.400',
      'imageUrl':
          'https://images.unsplash.com/photo-1556438064-2d7646166914?w=400',
    },
    {
      'title': 'Persona 5 Royal',
      'price': 'Rp 347.400',
      'imageUrl':
          'https://images.unsplash.com/photo-1511512578047-dfb367046420?w=400',
    },
  ];

  // Data untuk Weekend Deals
  final List<Map<String, dynamic>> weekendDeals = [
    {
      'title': 'TITANFALL 2',
      'subtitle': 'Offer ends Nov 20 on Steam',
      'price': 'Rp 347.400',
      'imageUrl':
          'https://images.unsplash.com/photo-1509198397868-475647b2a1e5?w=600',
    },
    {
      'title': 'Gunfire Reborn',
      'subtitle': 'Offer ends Nov 20 on Steam',
      'price': 'Rp 347.400',
      'imageUrl':
          'https://images.unsplash.com/photo-1552820728-8b83bb6b773f?w=600',
    },
  ];

  // Data untuk Recommended Based on Games You Play (kedua)
  final List<Map<String, dynamic>> recommendedGames2 = [
    {
      'title': 'Cyberpunk 2077',
      'price': 'Rp 347.400',
      'imageUrl':
          'https://images.unsplash.com/photo-1552820728-8b83bb6b773f?w=400',
      'discount': true,
    },
    {
      'title': 'RESIDENT EVIL VII',
      'price': 'Rp 347.400',
      'imageUrl':
          'https://images.unsplash.com/photo-1509198397868-475647b2a1e5?w=400',
    },
  ];

  // Data untuk Assassin's Creed Games
  final List<Map<String, dynamic>> assassinGames = [
    {
      'title': 'Assassin\'s Creed Valhalla',
      'price': 'Rp 347.400',
      'imageUrl':
          'https://images.unsplash.com/photo-1511512578047-dfb367046420?w=400',
    },
    {
      'title': 'Assassin\'s Creed Origins',
      'price': 'Rp 347.400',
      'imageUrl':
          'https://images.unsplash.com/photo-1556438064-2d7646166914?w=400',
    },
  ];

  // Data untuk From Developers
  final List<Map<String, dynamic>> developerGames = [
    {
      'title': 'Cyberpunk 2077',
      'price': 'Rp 347.400',
      'imageUrl':
          'https://images.unsplash.com/photo-1552820728-8b83bb6b773f?w=400',
      'discount': true,
    },
    {
      'title': 'RESIDENT EVIL VII',
      'price': 'Rp 347.400',
      'imageUrl':
          'https://images.unsplash.com/photo-1509198397868-475647b2a1e5?w=400',
    },
  ];

  // Data untuk Under Rp 90 000
  final List<Map<String, dynamic>> budgetGames = [
    {
      'title': 'RV THERE YET?',
      'price': 'Rp 67.400',
      'imageUrl':
          'https://images.unsplash.com/photo-1556438064-2d7646166914?w=400',
    },
    {
      'title': 'MY LIFE',
      'price': 'Rp 47.400',
      'imageUrl':
          'https://images.unsplash.com/photo-1511512578047-dfb367046420?w=400',
    },
  ];

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    print('Scroll position: ${_scrollController.offset.toStringAsFixed(2)}');
  }

  Future<void> _onRefresh() async {
    print('🔄 Refreshing started...');
    await Future.delayed(const Duration(seconds: 1));
    print('✅ Refresh completed!');

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Page refreshed!'),
          duration: Duration(seconds: 1),
        ),
      );
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1B2838),
      body: RefreshIndicator(
        onRefresh: _onRefresh,
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            _buildAppBar(),
            _buildSearchBar(),
            _buildFeaturedGames(),
            const SliverPadding(padding: EdgeInsets.only(top: 16)),
            _buildSectionTitle('Browse By Genre'),
            _buildGenreSection(),
            _buildSectionTitle('Recommended By The Community'),
            _buildSmallGameSection(communityGames),
            _buildSectionTitle('Recommended Based on the Games You Play'),
            _buildSmallGameSection(recommendedGames1),
            _buildSectionTitle('Weekend Deal'),
            _buildWeekendDeals(),
            _buildSectionTitle('Recommended Based on the Games You Play'),
            _buildSmallGameSection(recommendedGames2),
            _buildSectionTitle(
              'Because You Played Assassin\'s Creed® IV Black Flag™',
            ),
            _buildSmallGameSection(assassinGames),
            _buildSectionTitle('The Community Recommends'),
            _buildCommunityReview(),
            _buildSectionTitle('From Developers and Publishers You Know'),
            _buildSmallGameSection(developerGames),
            _buildSectionTitle('Under Rp 90 000'),
            _buildSmallGameSection(budgetGames),
            const SliverToBoxAdapter(child: SizedBox(height: 100)),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  // Method untuk build App Bar
  Widget _buildAppBar() {
    return SliverAppBar(
      backgroundColor: const Color(0xFF171A21),
      pinned: true,
      elevation: 0,
      title: Row(
        children: [
          Image.asset(
            'assets/images/steam.png',
            height: 24,
            errorBuilder: (context, error, stackTrace) {
              return const Icon(Icons.videogame_asset, color: Colors.white);
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
      actions: [
        IconButton(
          icon: const Icon(Icons.notifications_outlined, color: Colors.white70),
          onPressed: () => print('Notification button pressed'),
        ),
        IconButton(
          icon: const Icon(Icons.shopping_cart_outlined, color: Colors.white70),
          onPressed: () => print('Shopping cart button pressed'),
        ),
        IconButton(
          icon: const Icon(Icons.settings_outlined, color: Colors.white70),
          onPressed: () => print('Settings button pressed'),
        ),
        IconButton(
          icon: const Icon(Icons.download_outlined, color: Colors.white70),
          onPressed: () => print('Download button pressed'),
        ),
      ],
    );
  }

  // Method untuk build Search Bar
  Widget _buildSearchBar() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          decoration: InputDecoration(
            hintText: 'search',
            hintStyle: const TextStyle(color: Colors.white30),
            filled: true,
            fillColor: const Color(0xFF0E1419),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: const BorderSide(color: Colors.white24, width: 1.0),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
          ),
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  // Method untuk build Featured Games
  Widget _buildFeaturedGames() {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 200,
        child: ListView.builder(
          padding: const EdgeInsets.only(left: 16.0, right: 8.0),
          scrollDirection: Axis.horizontal,
          itemCount: featuredGames.length,
          itemBuilder: (context, index) {
            final game = featuredGames[index];
            return GameCard(
              title: game['title'],
              imagePath: game['imagePath'],
              price: game['price'],
              ratingText: game['ratingText'],
              discount: game['discount'],
            );
          },
        ),
      ),
    );
  }

  // Method untuk build Genre Section
  Widget _buildGenreSection() {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 100,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: genres.length,
          itemBuilder: (context, index) {
            final genre = genres[index];
            return GenreCard(
              title: genre['title'],
              icon: genre['icon'],
              color: genre['color'],
              imageUrl: genre['imageUrl'],
            );
          },
        ),
      ),
    );
  }

  // Method untuk build Small Game Section (reusable)
  Widget _buildSmallGameSection(List<Map<String, dynamic>> games) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 180,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: games.length,
          itemBuilder: (context, index) {
            final game = games[index];
            return SmallGameCard(
              title: game['title'],
              price: game['price'],
              imageUrl: game['imageUrl'],
              discount: game['discount'] ?? false,
            );
          },
        ),
      ),
    );
  }

  // Method untuk build Weekend Deals
  Widget _buildWeekendDeals() {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 220,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: weekendDeals.length,
          itemBuilder: (context, index) {
            final deal = weekendDeals[index];
            return WideGameCard(
              title: deal['title'],
              subtitle: deal['subtitle'],
              price: deal['price'],
              imageUrl: deal['imageUrl'],
            );
          },
        ),
      ),
    );
  }

  // Method untuk build Community Review
  Widget _buildCommunityReview() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Container(
          height: 200,
          decoration: BoxDecoration(
            color: const Color(0xFF0E1419),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    bottomLeft: Radius.circular(8),
                  ),
                  child: Image.network(
                    'https://images.unsplash.com/photo-1552820728-8b83bb6b773f?w=400',
                    fit: BoxFit.cover,
                    height: double.infinity,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: const Color(0xFF1B5E8F),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const SingleChildScrollView(
                            child: Text(
                              '"I\'ve only had this game a few days but already became so addicted, I can\'t stop playing! Everything about it is feels like a mix of Lethal Company and SCP"',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 11,
                                height: 1.4,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Read More like this',
                        style: TextStyle(
                          color: Colors.blue.shade300,
                          fontSize: 10,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 12,
                            backgroundColor: Colors.grey.shade700,
                            child: const Icon(
                              Icons.person,
                              size: 14,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Streyyy Kids',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  '2,207 products in account',
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.6),
                                    fontSize: 9,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Method untuk build Section Title
  Widget _buildSectionTitle(String title) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 24, 16, 12),
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  // Method untuk build Bottom Navigation Bar
  Widget _buildBottomNavigationBar() {
    final List<Map<String, dynamic>> navItems = [
      {'icon': Icons.home}, // Index 0: Home
      {'icon': Icons.widgets_outlined}, // Index 1: News
      {'icon': Icons.qr_code_scanner}, // Index 2: Guard (QR)
      {'icon': Icons.shield_outlined}, // Index 3: Library
      {'icon': Icons.chat_bubble_outline}, // Index 4: Community (Chat)
    ];

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
        currentIndex: 0,
        onTap: (index) {
          if (index == 1) {
            // KE NEWS
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const NewsPage()),
            );
          } else if (index == 2) {
            // KE GUARD (Memanggil QRScannerPage sesuai file guard.dart kamu)
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const QRScannerPage()),
            );
          } else if (index == 3) {
            // KE LIBRARY
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LibraryPage()),
            );
          }
          // Tambahkan logika untuk index 4 jika CommunityPage sudah ada
        },
        items: navItems
            .map(
              (item) =>
                  BottomNavigationBarItem(icon: Icon(item['icon']), label: ''),
            )
            .toList(),
      ),
    );
  }
}
