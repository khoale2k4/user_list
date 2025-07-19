class Response<T> {
  final bool success;
  final String message;
  final T? data;

  Response(this.success, this.message, this.data);

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'data': data,
    };
  }
}
