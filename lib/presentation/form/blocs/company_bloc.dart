import 'package:bloc/bloc.dart';
import 'package:bungasari_app/data/dataresource/company_remote_dataresource.dart';
import 'package:bungasari_app/data/model/response/company_response_dataresource.dart';
import 'package:meta/meta.dart';

part 'company_event.dart';
part 'company_state.dart';

class CompanyBloc extends Bloc<CompanyEvent, CompanyState> {
  final CompanyRemoteDataresource companyRemoteDataresource;

  CompanyBloc(this.companyRemoteDataresource) : super(CompanyInitial()) {
    on<CompanyButtonPressed>((event, emit) async{
      emit(CompanyLoading());

      final response = await companyRemoteDataresource.create(
          event.name,
          event.email,
          event.address,
          event.phone,
          event.logo,
          event.businessType,
          event.description,
          event.notes,
          event.attachment
      );

      response.fold(
            (l) => emit(CompanyFailure(message: l)),
            (r) => emit(CompanySuccess(companyResponseModel: r)),
      );
    });
  }
}
