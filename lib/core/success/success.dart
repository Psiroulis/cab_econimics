class Success {
  final String message;

  const Success({required this.message});
}

class ServerSuccess extends Success {
  ServerSuccess({required String message}) : super(message: message);
}
