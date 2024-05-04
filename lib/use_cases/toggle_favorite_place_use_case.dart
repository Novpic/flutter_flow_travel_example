
import 'package:flutter_flow_travel_example/repositories/firebase_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class ToggleFavoritePlaceUseCase{
  final FirebaseRepository _firebaseRepository;

  ToggleFavoritePlaceUseCase(this._firebaseRepository);

  Future<void> call(String id, bool isFavorite){
    return _firebaseRepository.updateCollection('places',id, {'is_favorite': isFavorite});
  }
}

final toggleFavoritePlaceUseCaseProvider = Provider<ToggleFavoritePlaceUseCase>((ref) => ToggleFavoritePlaceUseCase(ref.read(fireStoreRepositoryProvider)));