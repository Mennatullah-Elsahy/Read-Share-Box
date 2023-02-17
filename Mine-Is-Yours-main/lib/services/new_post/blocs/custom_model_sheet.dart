class CustomModelSheet<T>{
  final int? id ;
  final String? relatedId ;
  final String? name;
  final String? value;
  bool? isSelected;
  final dynamic list ;
  CustomModelSheet({this.id,this.relatedId ,this.list,this.name ,this.isSelected = false, this.value});

  toJson(){
    var data = {};
    data["id"] = id ;
    data["name"] = name ;
    data["value"] = value ;
    // data["isSelected"] = isSelected ;
    // data["list"] = list ;
    return data ;
  }


}
