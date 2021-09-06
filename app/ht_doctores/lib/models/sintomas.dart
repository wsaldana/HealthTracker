class Sintomas {

  //user profile
  int _id;
  int _idUsuario;
  String _fecha;
  int _dolorCabeza;
  int _molestiaEspaldaBaja;
  int _diarrea;
  int _sangrados;
  int _calambres;

  //Constructor
  Sintomas(
    int id, 
    int idUsuario, 
    String fecha, 
    int dolorCabeza, 
    int molestiaEspaldaBaja, 
    int diarrea, 
    int sangrados, 
    int calambres
  ){
    this._id = id;
    this._idUsuario = idUsuario;
    this._fecha = fecha;
    this._dolorCabeza = dolorCabeza;
    this._molestiaEspaldaBaja = molestiaEspaldaBaja;
    this._diarrea = diarrea;
    this._sangrados = sangrados;
    this._calambres = calambres;
  }

  //Setters y Getters
  get id => this._id;
  set id(value) => this._id = value;

  get idUsuario => this._idUsuario;
  set idUsuario(value) => this._idUsuario = value;

  get fecha => this._fecha;
  set fecha(value) => this._fecha = value;

  get dolorCabeza => this._dolorCabeza;
  set dolorCabeza(value) => this._dolorCabeza = value;

  get molestiaEspaldaBaja => this._molestiaEspaldaBaja;
  set molestiaEspaldaBaja(value) => this._molestiaEspaldaBaja = value;

  get diarrea => this._diarrea;
  set diarrea(value) => this._diarrea = value;

  get sangrados => this._sangrados;
  set sangrados(value) => this._sangrados = value;

  get calambres => this._calambres;
  set calambres(value) => this._calambres = value;
}