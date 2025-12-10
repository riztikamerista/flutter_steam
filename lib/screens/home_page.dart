import 'package:flutter/material.dart';
import '../widgets/game_card.dart';
import '../widgets/small_game_card.dart';
import '../widgets/wide_game_card.dart';
import '../widgets/genre_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();

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
    // Simulasi loading data
    await Future.delayed(const Duration(seconds: 1));
    print('✅ Refresh completed!');

    // Tampilkan snackbar untuk konfirmasi
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
            // App Bar dengan Steam Logo dan Icons
            SliverAppBar(
              backgroundColor: const Color(0xFF171A21),
              pinned: true,
              elevation: 0,
              title: Row(
                children: [
                  Image.asset(
                    'assets/images/steam.png',
                    height: 24,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(
                        Icons.videogame_asset,
                        color: Colors.white,
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
              actions: [
                IconButton(
                  icon: const Icon(
                    Icons.notifications_outlined,
                    color: Colors.white70,
                  ),
                  onPressed: () {
                    print('Notification button pressed');
                  },
                ),
                IconButton(
                  icon: const Icon(
                    Icons.shopping_cart_outlined,
                    color: Colors.white70,
                  ),
                  onPressed: () {
                    print('Shopping cart button pressed');
                  },
                ),
                IconButton(
                  icon: const Icon(
                    Icons.settings_outlined,
                    color: Colors.white70,
                  ),
                  onPressed: () {
                    print('Settings button pressed');
                  },
                ),
                IconButton(
                  icon: const Icon(
                    Icons.download_outlined,
                    color: Colors.white70,
                  ),
                  onPressed: () {
                    print('Download button pressed');
                  },
                ),
              ],
            ),

            // Search Bar
            SliverToBoxAdapter(
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
                      borderSide: const BorderSide(
                        color: Colors.white24,
                        width: 1.0,
                      ),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                  ),
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),

            // Featured Game Card
            SliverToBoxAdapter(
              child: SizedBox(
                height: 200,
                child: ListView.builder(
                  padding: const EdgeInsets.only(left: 16.0, right: 8.0),
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return const GameCard(
                      title: 'FINAL FANTASY VII REMAKE',
                      imagePath: 'assets/images/ffvii_remake.jpg',
                      price: 'Rp 347.400',
                      ratingText: '(Very Positive)',
                      discount: 40,
                    );
                  },
                ),
              ),
            ),

            const SliverPadding(padding: EdgeInsets.only(top: 16)),

            // Browse By Genre
            _buildSectionTitle('Browse By Genre'),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 100,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  children: [
                    GenreCard(
                      title: 'To Play',
                      icon: Icons.play_arrow,
                      color: Colors.blue,
                      imageUrl:
                          'https://images.unsplash.com/photo-1511512578047-dfb367046420?w=200',
                    ),
                    GenreCard(
                      title: 'Action',
                      icon: Icons.flash_on,
                      color: Colors.blue.shade700,
                      imageUrl:
                          'https://images.unsplash.com/photo-1509198397868-475647b2a1e5?w=200',
                    ),
                    GenreCard(
                      title: 'Horror',
                      icon: Icons.warning,
                      color: Colors.purple.shade900,
                      imageUrl:
                          'https://images.unsplash.com/photo-1509347528160-9a9e33742cdb?w=200',
                    ),
                    GenreCard(
                      title: 'Strategy',
                      icon: Icons.psychology,
                      color: Colors.blueGrey,
                      imageUrl:
                          'https://images.unsplash.com/photo-1560253023-3ec5d502959f?w=200',
                    ),
                    GenreCard(
                      title: 'Sports',
                      icon: Icons.sports_basketball,
                      color: Colors.blue.shade900,
                      imageUrl:
                          'https://images.unsplash.com/photo-1461896836934-ffe607ba8211?w=200',
                    ),
                  ],
                ),
              ),
            ),

            // Recommended By The Community
            _buildSectionTitle('Recommended By The Community'),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 180,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  children: [
                    SmallGameCard(
                      title: 'Uncharted: Legacy of...',
                      price: 'Rp 347.400',
                      imageUrl:
                          'https://images.unsplash.com/photo-1556438064-2d7646166914?w=400',
                    ),
                    SmallGameCard(
                      title: 'SPIDER-MAN 2',
                      price: 'Rp 347.400',
                      imageUrl:
                          'https://images.unsplash.com/photo-1509198397868-475647b2a1e5?w=400',
                    ),
                    SmallGameCard(
                      title: 'THE LAST OF US Part II',
                      price: 'Rp 347.400',
                      imageUrl:
                          'https://images.unsplash.com/photo-1552820728-8b83bb6b773f?w=400',
                    ),
                    SmallGameCard(
                      title: 'Uncharted 4',
                      price: 'Rp 347.400',
                      imageUrl:
                          'https://images.unsplash.com/photo-1556438064-2d7646166914?w=400',
                    ),
                  ],
                ),
              ),
            ),

            // Recommended Based on the Games You Play
            _buildSectionTitle('Recommended Based on the Games You Play'),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 180,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  children: [
                    SmallGameCard(
                      title: 'Persona 5 Royal',
                      price: 'Rp 347.400',
                      imageUrl:
                          'https://images.unsplash.com/photo-1511512578047-dfb367046420?w=400',
                    ),
                    SmallGameCard(
                      title: 'UNCHARTED: Legacy',
                      price: 'Rp 347.400',
                      imageUrl:
                          'https://images.unsplash.com/photo-1556438064-2d7646166914?w=400',
                    ),
                    SmallGameCard(
                      title: 'UNCHARTED 4',
                      price: 'Rp 347.400',
                      imageUrl:
                          'https://images.unsplash.com/photo-1556438064-2d7646166914?w=400',
                    ),
                    SmallGameCard(
                      title: 'Persona 5 Royal',
                      price: 'Rp 347.400',
                      imageUrl:
                          'https://images.unsplash.com/photo-1511512578047-dfb367046420?w=400',
                    ),
                  ],
                ),
              ),
            ),

            // Weekend Deals
            _buildSectionTitle('Weekend Deal'),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 220,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  children: [
                    WideGameCard(
                      title: 'TITANFALL 2',
                      subtitle: 'Offer ends Nov 20 on Steam',
                      price: 'Rp 347.400',
                      imageUrl:
                          'https://images.unsplash.com/photo-1509198397868-475647b2a1e5?w=600',
                    ),
                    WideGameCard(
                      title: 'Gunfire Reborn',
                      subtitle: 'Offer ends Nov 20 on Steam',
                      price: 'Rp 347.400',
                      imageUrl:
                          'https://images.unsplash.com/photo-1552820728-8b83bb6b773f?w=600',
                    ),
                  ],
                ),
              ),
            ),

            // More sections
            _buildSectionTitle('Recommended Based on the Games You Play'),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 180,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  children: [
                    SmallGameCard(
                      title: 'Cyberpunk 2077',
                      price: 'Rp 347.400',
                      imageUrl:
                          'https://images.unsplash.com/photo-1552820728-8b83bb6b773f?w=400',
                      discount: true,
                    ),
                    SmallGameCard(
                      title: 'RESIDENT EVIL VII',
                      price: 'Rp 347.400',
                      imageUrl:
                          'https://images.unsplash.com/photo-1509198397868-475647b2a1e5?w=400',
                    ),
                  ],
                ),
              ),
            ),

            _buildSectionTitle(
              'Because You Played Assassin\'s Creed® IV Black Flag™',
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 180,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  children: [
                    SmallGameCard(
                      title: 'Assassin\'s Creed Valhalla',
                      price: 'Rp 347.400',
                      imageUrl:
                          'https://images.unsplash.com/photo-1511512578047-dfb367046420?w=400',
                    ),
                    SmallGameCard(
                      title: 'Assassin\'s Creed Origins',
                      price: 'Rp 347.400',
                      imageUrl:
                          'https://images.unsplash.com/photo-1556438064-2d7646166914?w=400',
                    ),
                  ],
                ),
              ),
            ),

            _buildSectionTitle('The Community Recommends'),
            SliverToBoxAdapter(
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
                      // Gambar Game di Kiri
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

                      // Review Box di Kanan
                      Expanded(
                        flex: 2,
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Review Text
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

                              // Link "Read More like this"
                              Text(
                                'Read More like this',
                                style: TextStyle(
                                  color: Colors.blue.shade300,
                                  fontSize: 10,
                                  decoration: TextDecoration.underline,
                                ),
                              ),

                              const SizedBox(height: 8),

                              // User Info
                              Row(
                                children: [
                                  // Avatar
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

                                  // User Name & Info
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                            color: Colors.white.withOpacity(
                                              0.6,
                                            ),
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
            ),

            _buildSectionTitle('From Developers and Publishers You Know'),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 180,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  children: [
                    SmallGameCard(
                      title: 'Cyberpunk 2077',
                      price: 'Rp 347.400',
                      imageUrl:
                          'https://images.unsplash.com/photo-1552820728-8b83bb6b773f?w=400',
                      discount: true,
                    ),
                    SmallGameCard(
                      title: 'RESIDENT EVIL VII',
                      price: 'Rp 347.400',
                      imageUrl:
                          'https://images.unsplash.com/photo-1509198397868-475647b2a1e5?w=400',
                    ),
                  ],
                ),
              ),
            ),

            _buildSectionTitle('Under Rp 90 000'),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 180,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  children: [
                    SmallGameCard(
                      title: 'RV THERE YET?',
                      price: 'Rp 67.400',
                      imageUrl:
                          'https://images.unsplash.com/photo-1556438064-2d7646166914?w=400',
                    ),
                    SmallGameCard(
                      title: 'MY LIFE',
                      price: 'Rp 47.400',
                      imageUrl:
                          'https://images.unsplash.com/photo-1511512578047-dfb367046420?w=400',
                    ),
                  ],
                ),
              ),
            ),

            const SliverToBoxAdapter(child: SizedBox(height: 100)),
          ],
        ),
      ),
      bottomNavigationBar: Container(
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
            print('Bottom navigation tapped: index $index');
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
            BottomNavigationBarItem(
              icon: Icon(Icons.widgets_outlined),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shield_outlined),
              label: '',
            ),
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
      ),
    );
  }

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
}
