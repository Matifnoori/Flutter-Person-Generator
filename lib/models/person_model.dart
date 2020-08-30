class PersonModel{

  String first;
  String last;
  String dob;
  String phone;
  String nationality;
  String city;
  String streetNumber;
  String streetName;
  String email;
  String imageUrl;

  PersonModel({this.first, this.last, this.dob, this.phone, this.nationality, this.city, this.streetNumber, this.streetName, this.email, this.imageUrl});

  factory PersonModel.fromJson(Map<String, dynamic> json){
    return PersonModel(
      first: json['results'][0]['name']['first'],
      last: json['results'][0]['name']['last'],
      dob: json['results'][0]['dob']['date'],
      phone: json['results'][0]['phone'],
      email: json['results'][0]['email'],
      streetNumber: json['results'][0]['location']['street']['number'].toString(),
      streetName: json['results'][0]['location']['street']['name'],
      city: json['results'][0]['location']['city'],
      nationality: json['results'][0]['location']['country'],
      imageUrl: json['results'][0]['picture']['large'],
    );
  }

}