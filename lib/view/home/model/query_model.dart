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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['api_key'] = apiKey;
    data['query'] = query;
    data['page'] = page;
    return data;
  }
}
