import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:real_estate_app/features/landlord/presentation/properties_screen.dart';
import 'package:real_estate_app/features/landlord/presentation/add_property_screen.dart';
import 'package:real_estate_app/features/messages/presentation/messages_screen.dart';
import 'package:real_estate_app/features/profile/presentation/profile_screen.dart';

class LandlordNavigation extends StatelessWidget {
  const LandlordNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Navigator(
        onGenerateRoute: (settings) {
          return MaterialPageRoute(
            builder: (context) {
              switch (settings.name) {
                case '/properties':
                  return const PropertiesScreen();
                case '/add-property':
                  return const AddPropertyScreen();
                case '/messages':
                  return const MessagesScreen();
                case '/profile':
                  return const ProfileScreen();
                default:
                  return const PropertiesScreen();
              }
            },
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Properties',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Add Property',
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
              context.go('/properties');
              break;
            case 1:
              context.go('/add-property');
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
    if (location.startsWith('/properties')) return 0;
    if (location.startsWith('/add-property')) return 1;
    if (location.startsWith('/messages')) return 2;
    if (location.startsWith('/profile')) return 3;
    return 0;
  }
}
