import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'servicedetails_state.dart';

class ServicedetailsCubit extends Cubit<ServicedetailsState> {
  ServicedetailsCubit() : super(ServicedetailsInitial());
}
