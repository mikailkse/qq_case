class QueryModel {
  String? apiKey;
  String? query;
  int? page;

  QueryModel({
    this.apiKey,
    this.query,
    this.page,
  });

  QueryModel.fromJson(Map<String, dynamic> json) {
    apiKey = json['api_key'];
    query = json['query'];
    page = json['page'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['api_key'] = this.apiKey;
    data['query'] = this.query;
    data['page'] = this.page;
    return data;
  }
}
