class Paciente {

  //user profile
  String _nombre;
  String _correo;
  String _telefono;
  //User's medical history
  String _tipoDeSangre;
  String _padecimientos;
  String _cirugias;
  String _enfermedadesHereditarias;
  //Others
  String _estado;
  String _foto;

  //Constructor
  Paciente(String nombre, String correo, String telefono, String tipoDeSangre, String padecimeintos, String cirugias, String enfermedadesHereditarias, String estado, String foto){
    this._nombre = nombre;
    this._correo = correo;
    this._telefono = telefono;
    this._tipoDeSangre = tipoDeSangre;
    this._padecimientos = padecimeintos;
    this._cirugias = cirugias;
    this._enfermedadesHereditarias = enfermedadesHereditarias;
    this._estado = estado;
    this._foto = foto;
  }

  //Setters y Getters
  get nombre => this._nombre;
  set nombre( value) => this._nombre = value;

  get correo => this._correo;
  set correo( value) => this._correo = value;

  get telefono => this._telefono;
  set telefono( value) => this._telefono = value;

  get tipoDeSangre => this._tipoDeSangre;
  set tipoDeSangre( value) => this._tipoDeSangre = value;

  get padecimientos => this._padecimientos;
  set padecimientos( value) => this._padecimientos = value;

  get cirugias => this._cirugias;
  set cirugias( value) => this._cirugias = value;

  get enfermedadesHereditarias => this._enfermedadesHereditarias;
  set enfermedadesHereditarias( value) => this._enfermedadesHereditarias = value;

  get estado => this._estado;
  set estado( value) => this._estado = value;

  get foto => this._foto;
  set foto( value) => this._foto = value;

}