
import 'package:flutter_flow_travel_example/models/place.dart';
import 'package:flutter_flow_travel_example/repositories/firebase_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class ReadFavoritePlacesUseCase{
  final FirebaseRepository _firebaseRepository;

  ReadFavoritePlacesUseCase(this._firebaseRepository);

  Stream<List<Place>> call(){
    return _firebaseRepository.readAllCollectionWhere('places','is_favorite', true).asyncMap((event) => event.map((e) => Place.fromJson(e)).toList());
  }
}

final readFavoritePlacesUseCaseProvider = Provider<ReadFavoritePlacesUseCase>((ref) => ReadFavoritePlacesUseCase(ref.read(fireStoreRepositoryProvider)));