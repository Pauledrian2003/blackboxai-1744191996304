import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:real_estate_app/features/auth/presentation/auth_screen.dart';
import 'package:real_estate_app/features/landlord/presentation/landlord_navigation.dart';
import 'package:real_estate_app/features/landlord/presentation/add_property_screen.dart';
import 'package:real_estate_app/features/tenant/presentation/tenant_navigation.dart';

final routerProvider = Provider<GoRouter>((ref) {
  // TODO: Replace with actual auth state provider
  final isAuthenticated = false;
  final userRole = 'tenant'; // 'landlord' or 'tenant'

  return GoRouter(
    initialLocation: '/auth',
    routes: [
      GoRoute(
        path: '/auth',
        builder: (context, state) => const AuthScreen(),
      ),
      ShellRoute(
        builder: (context, state, child) {
          if (userRole == 'landlord') {
            return const LandlordNavigation();
          } else {
            return const TenantNavigation();
          }
        },
        routes: [
          // Landlord routes
          GoRoute(
            path: '/properties',
            builder: (context, state) => const SizedBox(),
          ),
          GoRoute(
            path: '/add-property',
            builder: (context, state) {
              final property = state.extra as Property?;
              return AddPropertyScreen(property: property);
            },
          ),
          // Tenant routes
          GoRoute(
            path: '/browse',
            builder: (context, state) => const SizedBox(),
          ),
          GoRoute(
            path: '/favorites',
            builder: (context, state) => const SizedBox(),
          ),
          // Shared routes
          GoRoute(
            path: '/messages',
            builder: (context, state) => const SizedBox(),
          ),
          GoRoute(
            path: '/profile',
            builder: (context, state) => const SizedBox(),
          ),
          GoRoute(
            path: '/property/:id',
            builder: (context, state) {
              // TODO: Get property from state.params['id']
              final isOwner = false; // TODO: Check if current user is owner
              return PropertyDetailsScreen(
                property: Property(
                  id: '1',
                  title: 'Sample Property',
                  description: 'Sample description',
                  price: 1000,
                  location: 'Sample location',
                  images: ['https://example.com/image.jpg'],
                  bedrooms: 2,
                  bathrooms: 1,
                  area: 85,
                  ownerId: 'user1',
                  createdAt: DateTime.now(),
                  type: PropertyType.apartment,
                ),
                isOwner: isOwner,
              );
            },
          ),
        ],
      ),
    ],
    redirect: (context, state) {
      if (!isAuthenticated && state.location != '/auth') {
        return '/auth';
      }
      if (isAuthenticated && state.location == '/auth') {
        return userRole == 'landlord' ? '/properties' : '/browse';
      }
      return null;
    },
  );
});
