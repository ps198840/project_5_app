class Oefening  {
  final int id;
  final String naam;
  final String beschrijving;
  //final List<Student>? studenten;

  Oefening({
    required this.id,
    required this.naam,
    required this.beschrijving,
    //this.studenten,
  });

  factory Oefening.fromJson(Map<String, dynamic> json) {
    return Oefening(
      id: json['id'],
      naam: json['naam'],
      beschrijving: json['beschrijving']
    );
  }

  @override
  bool operator ==(Object other) {
    if (other is Oefening) {
      return other.id == id;
    } else {
      return false;
    }
  }

  @override
  // TODO: implement hashCode
  int get hashCode => '$naam$id'.hashCode;
}