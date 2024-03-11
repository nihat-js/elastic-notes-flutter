enum MissionPlace {
  genclik ,
  genclikMall,
  yasamal,
  yesilvadi,
  nikobank,
  subway,
  gym,
  casino,
  school,
  sahdag,
  sehirmerkezi,
}

List missionPlaces = [
  {
    "name": MissionPlace.genclik,
    "requiredLevel": 10,
    "background": "images/places/yesilvadi.png"
  },
  {
    "name": MissionPlace.yasamal,
    "requiredLevel": 15,
    "background": "images/places/sehir-merkezi.png"
  }
];

List levels = [
  {"level": 1, "xp": 5},
  {"level": 2, "xp": 10},
  {"level": 3, "xp": 15},
  {"level": 4, "xp": 20},
];



enum MissionDifficulty { easy, normal, hard }

enum MissionCharacters { vorMahir, cpIlqar }

enum Skill { stamina, strength, luck, dexterity }


List npcs = [
  {"name": "Mercury Huseyn", "image": "images/npcs/npc_hoody_very_evil_t2.png"},
  {"name": "Tetate AA", "image": "image/npcs/npc_hoody_very_evil_t2.png"}
];

List missionTextTemplates = [
  "Oğurlanmış artefaktı bərpa edin, tələləri gedin, mükafat üçün qayıdın.",
  "“Əsirləri azad edin, quldurlardan qaçın, təhlükəsiz qayıtmağı təmin edin",
  "Krallığı müdafiə edin, ork işğalını dəf edin, səltənəti qoruyun.",
  "Relikt əldə edin, tələləri dəf edin, onun sirlərini açın.",
  "Karvanı müşayiət edin, quldurları dəf edin, təhlükəsiz çatdırılmanı təmin edin.",
];
