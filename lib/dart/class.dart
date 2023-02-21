class Car {
  late int seats;
  late String colour;
  late String carname;

  Car(int seat, String col, [String name = "My"]) {
    seats = seat;
    colour = col;
    carname = name;
  }
  printVars(String name) {
    carname = name;
    print("$carname's body colour is $colour and $seats seat");
  }
}

class Van {
  late String model;
  late int seats;
  late String? colour;

  Van(this.model, {this.seats = 7, this.colour});
}

void main(List<String> args) {
  Car rene = Car(5, "Glagier");
  print("${rene.carname} car colour is ${rene.colour}");
  rene.printVars("Rene");
  print(rene.carname);

  Van tarago = Van("tarago", colour: "Red", seats: 9);
}
