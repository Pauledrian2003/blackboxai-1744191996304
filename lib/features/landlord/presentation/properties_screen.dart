import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:real_estate_app/features/properties/presentation/widgets/property_card.dart';
import 'package:real_estate_app/features/properties/domain/property_model.dart';

class PropertiesScreen extends ConsumerWidget {
  const PropertiesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: Replace with actual properties from provider
    final properties = <Property>[
      Property(
        id: '1',
        title: 'Modern Apartment in Downtown',
        description: 'Beautiful 2 bedroom apartment with great views',
        price: 2500,
        location: '123 Main St, New York',
        images: ['https://example.com/image1.jpg'],
        bedrooms: 2,
        bathrooms: 1,
        area: 85,
        ownerId: 'user1',
        createdAt: DateTime.now(),
        type: PropertyType.apartment,
      ),
      Property(
        id: '2',
        title: 'Cozy Studio Near University',
        description: 'Perfect for students, fully furnished',
        price: 1200,
        location: '456 College Ave, Boston',
        images: ['https://example.com/image2.jpg'],
        bedrooms: 1,
        bathrooms: 1,
        area: 45,
        ownerId: 'user1',
        createdAt: DateTime.now(),
        type: PropertyType.apartment,
      ),
    ];

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await context.push<Property?>('/add-property');
          if (result != null) {
            // TODO: Update properties list with new/edited property
          }
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text('My Properties'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              context.go('/add-property');
            },
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: properties.length,
        itemBuilder: (context, index) {
          final property = properties[index];
          return PropertyCard(
            property: property,
            showOwnerActions: true,
            onTap: () {
              context.go('/property/${property.id}');
            },
          );
        },
      ),
    );
  }
}
