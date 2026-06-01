import 'package:dartz/dartz.dart';
import 'package:waterrush/core/error/failure.dart';
import 'package:waterrush/core/usecase/base_usecase.dart';
import 'package:waterrush/features/custoomer/customer_cart/domain/entities/scheduled_time_entity.dart';
import 'package:waterrush/features/custoomer/customer_cart/domain/repositories/cart_repository.dart';

class GetScheduledTimesUseCase
    implements UseCase<List<ScheduledTimeEntity>, NoParams> {
  final CartRepository repository;

  GetScheduledTimesUseCase(this.repository);

  @override
  Future<Either<Failure, List<ScheduledTimeEntity>>> call(NoParams params) async {
    return await repository.getScheduledTimes();
  }
}
