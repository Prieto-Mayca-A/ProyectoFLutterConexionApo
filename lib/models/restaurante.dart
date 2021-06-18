
class Restaurante{
  final nombre_rest;
  final ubicacion;
  final descripcion;
  final vista;

  Restaurante({this.nombre_rest, this.ubicacion, this.descripcion, this.vista});

  factory Restaurante.fromJson(Map<String, dynamic> json){
    return Restaurante( 
    nombre_rest: json["nombre_rest"],
    ubicacion: json["ubicacion"],
    descripcion: json["descripcion"],
    vista: json["vista"]
    );
  }

}