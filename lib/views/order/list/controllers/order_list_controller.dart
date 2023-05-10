import 'package:equatable/equatable.dart';
import 'package:get/get.dart';

class OrderListController extends GetxController with StateMixin {
  List<OrderStateModel> orderStates = const [
    OrderStateModel(OrderState.all),
    OrderStateModel(OrderState.newState),
    OrderStateModel(OrderState.packing),
    OrderStateModel(OrderState.readyToShip),
    OrderStateModel(OrderState.shipped),
    OrderStateModel(OrderState.returnState),
    OrderStateModel(OrderState.verifyReturn),
    OrderStateModel(OrderState.track),
    OrderStateModel(OrderState.remittance),
  ];

  var tableColumns = <OrderColumns>[
    const OrderColumns(OrderColumnType.orderIdSource),
    const OrderColumns(OrderColumnType.placedOn),
    const OrderColumns(OrderColumnType.items),
    const OrderColumns(OrderColumnType.customer),
    const OrderColumns(OrderColumnType.amount),
    const OrderColumns(OrderColumnType.orderState),
  ].obs;

  var selectedOrderState = const OrderStateModel(OrderState.all).obs;
}

class OrderColumns extends Equatable {
  final OrderColumnType type;
  final bool isEnabled;

  const OrderColumns(this.type, {this.isEnabled = true});

  String getColumnName() {
    String name = "";
    switch (type) {
      case OrderColumnType.orderIdSource:
        name = "Order ID & Source";
        break;
      case OrderColumnType.placedOn:
        name = "Placed on";
        break;
      case OrderColumnType.items:
        name = "Items";
        break;
      case OrderColumnType.customer:
        name = "Customer";
        break;
      case OrderColumnType.amount:
        name = "Amount";
        break;
      case OrderColumnType.orderState:
        name = "Order State";
        break;
    }
    return name;
  }

  OrderColumns copyWith({bool? isEnabled}) => OrderColumns(
        type,
        isEnabled: isEnabled ?? this.isEnabled,
      );

  @override
  List<Object?> get props => [type];
}

class OrderStateModel extends Equatable {
  final OrderState state;
  final int? count;

  const OrderStateModel(this.state, {this.count});

  String getStateName() {
    String name = "";
    switch (state) {
      case OrderState.all:
        name = "All";
        break;
      case OrderState.newState:
        name = "New";
        break;
      case OrderState.packing:
        name = "Packing";
        break;
      case OrderState.readyToShip:
        name = "Ready to ship";
        break;
      case OrderState.shipped:
        name = "Shipped";
        break;
      case OrderState.returnState:
        name = "Return";
        break;
      case OrderState.verifyReturn:
        name = "Verify return";
        break;
      case OrderState.track:
        name = "Track";
        break;
      case OrderState.remittance:
        name = "Remittance";
        break;
    }
    return name;
  }

  @override
  List<Object?> get props => [state];
}

enum OrderState {
  all,
  newState,
  packing,
  readyToShip,
  shipped,
  returnState,
  verifyReturn,
  track,
  remittance
}

enum OrderColumnType {
  orderIdSource,
  placedOn,
  items,
  customer,
  amount,
  orderState
}
