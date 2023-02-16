part of 'auth_cubit.dart';

// ignore: must_be_immutable
class AuthState extends Equatable {
  bool isDone;
  bool isLoading;

  AuthState({required this.isLoading, required this.isDone});

  copyWith({
    bool? isLoading,
    bool? isDone,
    bool? isUzb,
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      isDone: isDone ?? this.isDone,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [isDone, isLoading];
}
