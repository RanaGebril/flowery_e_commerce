import 'package:flowery_e_commerce/core/result/result.dart';
import 'package:flowery_e_commerce/features/home/domain/entities/Home_content_entity.dart';
import 'package:flowery_e_commerce/features/home/domain/repositories/home_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class GetHomeContentUseCase {
  final HomeRepository _homeRepository;

  GetHomeContentUseCase(this._homeRepository);

  Future<Result<HomeContentEntity>> call() {
    return _homeRepository.getHomeContent();
  }
}
