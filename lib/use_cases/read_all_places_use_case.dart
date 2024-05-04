import 'package:flutter_flow_travel_example/models/place.dart';
import 'package:flutter_flow_travel_example/repositories/firebase_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReadAllPlacesUseCase {
  final FirebaseRepository _firebaseRepository;

  ReadAllPlacesUseCase(this._firebaseRepository);

  Stream<List<Place>> call() {
    return _firebaseRepository
        .readAllCollection('places')
        .asyncMap((event) => event.map((e) => Place.fromJson(e)).toList());
  }
}

final readAllPlacesUseCaseProvider = Provider<ReadAllPlacesUseCase>(
    (ref) => ReadAllPlacesUseCase(ref.read(fireStoreRepositoryProvider)));
