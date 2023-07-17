class ApiResponse<T> {
  ApiResponse({
    this.error,
    this.success,
    this.data,
    this.message,
  });
  final bool? success;
  final T? data;
  final dynamic message;
  final String? error;

  static ApiResponse<dynamic>? fromJson(Map<String, dynamic>? json) {
    if (json == null) return null;
    return ApiResponse<dynamic>(
      data: json['data'],
      message: json['message'],
      success: json['success'] != null ? json['success'] as bool : null,
      error: json['error'] as String?,
    );
  }

  @override
  String toString() {
    // ignore: lines_longer_than_80_chars
    return 'ApiResponse(success: $success, data: $data, error: $error, messages: $message)';
  }
}
