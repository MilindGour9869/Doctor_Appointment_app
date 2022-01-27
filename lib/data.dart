class Data{

  String s;



  Data.fromJson(Map<String , dynamic> json)
  {
    this.s=json[0].toString();

  }

}