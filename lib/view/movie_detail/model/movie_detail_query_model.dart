class DetailMovieQueryModel {
  String? apiKey;
  int? id;

  DetailMovieQueryModel({this.apiKey, this.id});

  DetailMovieQueryModel.fromJson(Map<String, dynamic> json) {
    apiKey = json['api_key'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['api_key'] = apiKey;
    data['id'] = id;
    return data;
  }
}
