import 'package:hh_express/models/api/paginated_data_model.dart';
import 'package:hh_express/models/order_history/order_history_model.dart';

abstract class OrderRepo {
  Future<PaginatedDataModel?> getOrderHistory(int page);
}
