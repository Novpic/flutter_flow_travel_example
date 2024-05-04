import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_flow_travel_example/models/place.dart';
import 'package:flutter_flow_travel_example/use_cases/toggle_favorite_place_use_case.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

class PlaceCard extends ConsumerWidget {
  const PlaceCard({super.key, required this.place});

  final Place place;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 200,
                width: double.infinity,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(place.imageUrl, fit: BoxFit.fitWidth)),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          place.name,
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            RatingBarIndicator(
                              itemBuilder: (context, index) => const Icon(
                                Icons.radio_button_checked_rounded,
                                color: Colors.black,
                              ),
                              direction: Axis.horizontal,
                              rating: place.rating,
                              unratedColor: Colors.grey,
                              itemCount: 5,
                              itemSize: 16,
                            ),
                            const Gap(8),
                            Text(
                              place.rating.toString(),
                              style: const TextStyle(fontSize: 12),
                            )
                          ],
                        )
                      ],
                    ),
                    IconButton(
                        iconSize: 25,
                        onPressed: () {
                          ref
                              .read(toggleFavoritePlaceUseCaseProvider)
                              .call(place.id, !place.isFavorite);
                        },
                        icon: Icon(
                          place.isFavorite
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: Colors.grey,
                        ))
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
