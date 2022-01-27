class JitsiResponse {
  final bool isSuccess;
  final String? message;
  final dynamic? error;

  JitsiResponse({
    required this.isSuccess,
    this.message,
    this.error,
  });

  @override
  String toString() {
    return 'JitsiResponse{isSuccess: $isSuccess, '
        'message: $message, error: $error}';
  }
}
