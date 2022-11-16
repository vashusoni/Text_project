class DataModel {
  int? number;
  String? alpha;

  DataModel(this.number, this.alpha);

  DataModel.fromJson(Map<String,dynamic>json){
    number=json["digit"];
    alpha=json["alpha"];

  }
}
