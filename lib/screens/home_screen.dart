import 'package:flutter/material.dart';
import 'package:flutter_flow_travel_example/screens/favorites_screen.dart';
import 'package:flutter_flow_travel_example/screens/widgets/place_card.dart';
import 'package:flutter_flow_travel_example/use_cases/read_all_places_use_case.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final readAllPlacesUseCase = ref.read(readAllPlacesUseCaseProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        automaticallyImplyLeading: false,
        centerTitle: false,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const FavoritesScreen()));
              },
              icon: const Icon(Icons.favorite_rounded))
        ],
        title: const Text(
          'Home',
          style: TextStyle(
            fontSize: 22,
          ),
        ),
      ),
      body: Column(
        children: [
          const Gap(20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              height: 50,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(40),
              ),
              child: const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.search_rounded, color: Colors.grey),
                  Expanded(
                    child: TextField(
                      textAlign: TextAlign.start,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        alignLabelWithHint: true,
                      ),
                    ),
                  ),
                  Icon(Icons.tune_rounded)
                ],
              ),
            ),
          ),
          const Gap(20),
          StreamBuilder(
              stream: readAllPlacesUseCase.call(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Expanded(
                      child: ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            final place = snapshot.data![index];
                            return PlaceCard(place: place);
                          }));
                }

                return const Center(child: CircularProgressIndicator());
              })
        ],
      ),
    );
  }
}
