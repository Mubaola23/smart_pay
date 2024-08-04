// To parse this JSON data, do
//
//     final dashboardResponse = dashboardResponseFromJson(jsonString);

class DashboardResponse {
  String? secret;

  DashboardResponse({
    this.secret,
  });

  factory DashboardResponse.fromJson(Map<String, dynamic> json) =>
      DashboardResponse(
        secret: json['secret'] as String? ?? '',
      );

  Map<String, dynamic> toJson() => {
        'secret': secret,
      };
}
