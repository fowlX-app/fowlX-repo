class records_details {
  int? numberOfChicks;
  int? numberOfHens;
  int? numberOfCocks;
  int? eggsCollected;
  int? deadBirds;

  records_details({
    required this.numberOfChicks,
    required this.numberOfHens,
    required this.numberOfCocks,
    required this.eggsCollected,
    required this.deadBirds,
  });

  Map<String, dynamic> toJson() => {
        'numberOfChicks': numberOfChicks,
        'numberOfHens': numberOfHens,
        'numberOfCocks': numberOfCocks,
        'eggsCollected': eggsCollected,
        'deadBirds': deadBirds,
      };
}
