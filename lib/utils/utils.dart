double generateRandomMoney(double min,double max, double chance){
  double foo = ( min + (max - min) * chance);
  return double.parse(foo.toStringAsFixed(2));
}


enum MissionPlace{
  yesilvadi,
  nikobank, 
  genclikMall,
  subway,
  gym,
  casino,
  school,
  sahdag,
  sehirmerkezi,
}


List missionPlaces = [MissionPlace.yesilvadi,MissionPlace.sehirmerkezi];
List missionPlaceBackgrounds = ["images/places/yesilvadi.png", "images/places/sehir-merkezi.png",];

//  setState(() {
  //     cashMoney += earnedMoney;
  //     logs.add({"text": templates[random.nextInt(templates.length)]});
  //   });
  // }