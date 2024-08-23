import 'package:bloc/bloc.dart';
import 'package:bloc_template/configs/extention/enums.dart';
import 'package:bloc_template/configs/model/user/user_model.dart';
import 'package:bloc_template/configs/repository/auth/login_repository.dart';
import 'package:bloc_template/main.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_states.dart';

class LoginBloc extends Bloc<LoginEvent, LoginStates> {
  AuthApiRepository authApiRepository;
  LoginBloc({required this.authApiRepository}) : super(LoginStates()) {
    on<UpdateEmail>(_updateEmailField);
    on<UpdatePassword>(_updatePasswordField);
    on<LoginButton>(_hitLoginApi);
  }

  void _updateEmailField(LoginEvent event, Emitter<LoginStates> emit) {
    emit(state.copyWith(email: state.email));
  }

  void _updatePasswordField(LoginEvent event, Emitter<LoginStates> emit) {
    emit(state.copyWith(password: state.password));
  }

  Future<void> _hitLoginApi(LoginEvent event, Emitter<LoginStates> emit) async {
    Map<String, String> data = {
      'email': state.email,
      'password': state.password,
    };
    emit(state.copyWith(
      postApiStatus: PostApiStatus.loading,
    ));
    await authApiRepository.loginApi(data).then((value) async {
      if (value.error.isNotEmpty) {
        emit(state.copyWith(
            postApiStatus: PostApiStatus.error, message: value.error));
      } else {
        // await SessionController().saveUserInPreference(value);
        // await SessionController().getUserFromPreference();
        emit(state.copyWith(postApiStatus: PostApiStatus.success));
        getIt.unregister<UserModel>();
        getIt.registerSingleton<UserModel>(value);
      }
    }).onError((error, stackTrace) {
      emit(state.copyWith(
          postApiStatus: PostApiStatus.error, message: error.toString()));
    });
  }
}
