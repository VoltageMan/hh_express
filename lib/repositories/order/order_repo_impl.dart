import 'package:hh_express/data/remote/dio_client.dart';
import 'package:hh_express/models/api/paginated_data_model.dart';
import 'package:hh_express/models/order_history/order_history_model.dart';
import 'package:hh_express/models/pagination/pagination_model.dart';
import 'package:hh_express/repositories/order/order_repo.dart';
import 'package:hh_express/settings/consts.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: OrderRepo)
class OrderRepoImpl extends OrderRepo with DioClientMixin  {
  @override
  Future<PaginatedDataModel<List<OrderHistoryModel>>?> getOrderHistory(int page) async {
    final response = await dio.get(endPoint: EndPoints.orderHistory);

    if (response.success) {
      final responseData = response.data[APIKeys.products];
      final pagination =
          PaginationModel.fromJson(responseData[APIKeys.pagination]);
      final orders = (responseData[APIKeys.data] as List)
          .map((e) => OrderHistoryModel.fromJson(e as Map<String, dynamic>))
          .toList();

      return PaginatedDataModel<List<OrderHistoryModel>>(
        data: orders,
        pagination: pagination,
      );
    }
    return null;
  }
}
