class RideProvider {
  String? name;
  int? commission;

  RideProvider({
     this.name,
     this.commission,
  });

  RideProvider.fromJson(Map<dynamic,dynamic> json){
    name = json["name"];
    commission = json["commission"];
  }

}


