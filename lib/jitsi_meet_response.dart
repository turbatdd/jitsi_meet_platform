class JitsiMeetResponse {
  final bool isSuccess;
  final String? message;
  final dynamic? error;

  JitsiMeetResponse({
    required this.isSuccess,
    this.message,
    this.error,
  });

  @override
  String toString() {
    return 'JitsiMeetResponse{isSuccess: $isSuccess, '
        'message: $message, error: $error}';
  }
}
