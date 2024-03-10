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



List levels  = [
  {
    "level" : 1,
    "xp" : 5,
  },
  {
    "level" : 2,
    "xp" : 10, 
  },
  {
    "level" : 3,
    "xp" : 15
  },
  {
    "level" : 4,
    "xp" : 20
  }
];


enum MissionDifficulty {
  easy,normal,hard
}

enum MissionCharacters{
  VorMahir,CPIlqar, 
}

enum Skill {
  stamina,strength,luck,dexterity
}
