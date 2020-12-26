import 'package:bms_electric/models/resseler/reseller.dart';
import 'package:bms_electric/services/manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResellersCubit extends Cubit<List<Reseller>> {
  ResellersCubit._(List state) : super([]);

  static final instance = ResellersCubit._([]);

  getResellers() async {
    List<Reseller> list = await Manager.instance.getAllResellers();
    emit(list);
  }
}
