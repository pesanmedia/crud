class Mynote {
  int id;
  String _title;
  String _note;
  String _createDate;
  String _updateDate;
  String _sortDate;

  Mynote(this._title, this._note, this._createDate, this._updateDate,
      this._sortDate);

  Mynote.map(dynamic obj) {
    this._title = obj["title"];
    this._note = obj["note"];
    this._createDate = obj["createDate"];
    this._updateDate = obj["updateDate"];
    this._sortDate = obj["sortDate"];
  }

  String get title => _title;
  String get note => _note;
  String get createDate => _createDate;
  String get updateDate => _updateDate;
  String get sortDate => _sortDate;

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();

    map["title"] = _title;
    map["note"] = _note;
    map["createDate"] = _createDate;
    map["updateDate"] = _updateDate;
    map["sortDate"] = _sortDate;

    return map;
  }

  void setNoteId(int id) {
    this.id = id;
  }
}
