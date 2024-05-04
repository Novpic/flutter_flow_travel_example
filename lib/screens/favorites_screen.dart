import 'package:flutter/material.dart';
import 'package:flutter_flow_travel_example/screens/widgets/favorite_card.dart';
import 'package:flutter_flow_travel_example/use_cases/read_favorite_places_use_case.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoritesScreen extends ConsumerWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final readFavoritePlacesUseCase =
        ref.read(readFavoritePlacesUseCaseProvider);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Favorites'),
          centerTitle: false,
          backgroundColor: Colors.grey[300],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: StreamBuilder(
                  stream: readFavoritePlacesUseCase.call(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            final place = snapshot.data![index];
                            return FavoriteCard(place: place);
                          });
                    }
                    return const Center(child: CircularProgressIndicator());
                  }),
            )
          ],
        ));
  }
}




