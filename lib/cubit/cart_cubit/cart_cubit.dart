import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_via_app/cubit/cart_cubit/cart_states.dart';

import '../../shared/constants.dart';

class CartCubit extends Cubit<CartStates> {
  CartCubit() : super(InitialState());

  static CartCubit get(context) => BlocProvider.of(context);

  

  double totalPrice = 0;

  void increamentCounter(int index) {
   boughtItems[index].count++;
    emit(counterPlusState());
  }

  void decreamentCounter(int index) {
   boughtItems[index].count--;
    emit(counterMinusState());
  }

  void calculateTotatlPrice() {
    totalPrice = 0;
    for (int i = 0; i < boughtItems.length; i++) {
      {
        totalPrice += (boughtItems[i].count * 100);
      }
    }
    emit(ChangeTotalPriceState());
  }

  void removeCartItem(int index) {
    
     boughtItems.removeAt(index);
     emit(RemoveItemState());
  }
}
