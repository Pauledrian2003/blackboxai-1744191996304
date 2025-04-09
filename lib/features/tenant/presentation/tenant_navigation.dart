import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:real_estate_app/features/tenant/presentation/browse_screen.dart';
import 'package:real_estate_app/features/tenant/presentation/favorites_screen.dart';
import 'package:real_estate_app/features/messages/presentation/messages_screen.dart';
import 'package:real_estate_app/features/profile/presentation/profile_screen.dart';

class TenantNavigation extends StatelessWidget {
  const TenantNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Navigator(
        onGenerateRoute: (settings) {
          return MaterialPageRoute(
            builder: (context) {
              switch (settings.name) {
                case '/browse':
                  return const BrowseScreen();
                case '/favorites':
                  return const FavoritesScreen();
                case '/messages':
                  return const MessagesScreen();
                case '/profile':
                  return const ProfileScreen();
                default:
                  return const BrowseScreen();
              }
            },
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Browse',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _getCurrentIndex(context),
        onTap: (index) {
          switch (index) {
            case 0:
              context.go('/browse');
              break;
            case 1:
              context.go('/favorites');
              break;
            case 2:
              context.go('/messages');
              break;
            case 3:
              context.go('/profile');
              break;
          }
        },
      ),
    );
  }

  static int _getCurrentIndex(BuildContext context) {
    final location = GoRouter.of(context).location;
    if (location.startsWith('/browse')) return 0;
    if (location.startsWith('/favorites')) return 1;
    if (location.startsWith('/messages')) return 2;
    if (location.startsWith('/profile')) return 3;
    return 0;
  }
}
