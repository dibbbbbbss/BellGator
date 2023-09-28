class SignInWithEmailAndPasswordFailure {
  final String message;

  const SignInWithEmailAndPasswordFailure(
      [this.message = "An unknown error has occured."]);

  factory SignInWithEmailAndPasswordFailure.code(String code) {
    switch (code) {
      case 'weak-password':
        return const SignInWithEmailAndPasswordFailure(
            'please enter a stronger password.');

      case 'invalid-email':
        return const SignInWithEmailAndPasswordFailure(
            'please enter a valid email.');

      case 'email-already-in-use':
        return const SignInWithEmailAndPasswordFailure(
            'please enter a unique email.');

      case 'operation-not-allowed':
        return const SignInWithEmailAndPasswordFailure(
            'please enter an allowed operation.');

      case 'user-disabled':
        return const SignInWithEmailAndPasswordFailure(
            'user is diabled contact support.');
      default:
        return SignInWithEmailAndPasswordFailure();
    }
  }
}
