import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'servicedetails_state.dart';

class ServicedetailsCubit extends Cubit<ServicedetailsState> {
  ServicedetailsCubit() : super(ServicedetailsInitial());
}
