library my_fuzzy_lib;

import 'dart:math';

class Perhitungan {
  int _bainput = 0;
  int _bbinput = 0;
  int _soalinput = 0;

  Perhitungan(this._bainput, this._bbinput, this._soalinput);

  int get bainput => _bainput;

  set bainput(int value) {
    _bainput = value;
  }

  int get bbinput => _bbinput;

  set bbinput(int value) {
    _bbinput = value;
  }

  int get soalinput => _soalinput;

  set soalinput(int value) {
    _soalinput = value;
  }

  generatemikroBawah(_bainput, _soalinput, _bbinput) {
    var result = (_bainput - _soalinput) / (_bainput - _bbinput);

    return result;
  }

  generatemikroAtas(_bainput, _soalinput, _bbinput) {
    var result = (_soalinput - _bbinput) / (_bainput - _bbinput);

    return result;
  }
}

class Komposisi{
  String bbOutput;
  String baOutput;
  String decisionRules1;
  String decisionRules2;
  String decisionRules3;
  String decisionRules4;
  double implikasiRules1;
  double implikasiRules2;
  double implikasiRules3;
  double implikasiRules4;


  Komposisi(this.bbOutput, this.baOutput, this.decisionRules1,
      this.decisionRules2, this.decisionRules3, this.decisionRules4,
      this.implikasiRules1, this.implikasiRules2, this.implikasiRules3,
      this.implikasiRules4);

  hitungBawah(){
    List<double> _bawah = [];

    if(decisionRules1 == bbOutput){
      _bawah.add(implikasiRules1);
    }
    if(decisionRules2 == bbOutput){
      _bawah.add(implikasiRules2);
    }
    if(decisionRules3 == bbOutput){
      _bawah.add(implikasiRules3);
    }
    if(decisionRules4 == bbOutput){
      _bawah.add(implikasiRules4);
    }

    var result = _bawah.reduce(max);
    return result;
  }

  hitungAtas(){
    List<double> _atas = [];

    if(decisionRules1 == baOutput){
      _atas.add(implikasiRules1);
    }
    if(decisionRules2 == baOutput){
      _atas.add(implikasiRules2);
    }
    if(decisionRules3 == baOutput){
      _atas.add(implikasiRules3);
    }
    if(decisionRules4 == baOutput){
      _atas.add(implikasiRules4);
    }

    var result = _atas.reduce(max);
    return result;
  }
}

class OperasiFuzzy {
  String decision1;
  String decision2;
  String decision3;
  String bbInput1;
  String baInput1;
  double bbMikroInput1;
  double baMikroInput1;
  String bbInput2;
  String baInput2;
  double bbMikroInput2;
  double baMikroInput2;

  OperasiFuzzy(
      this.decision1,
      this.decision2,
      this.decision3,
      this.bbInput1,
      this.baInput1,
      this.bbMikroInput1,
      this.baMikroInput1,
      this.bbInput2,
      this.baInput2,
      this.bbMikroInput2,
      this.baMikroInput2);

  Hitung() {
    var result;
    List<double> _value = [];
    if (decision1 == bbInput1 && decision2 == baInput2) {
      _value = [bbMikroInput1, baMikroInput2];
      result = _value.reduce(min);
    } else if (decision1 == bbInput1 && decision2 == bbInput2) {
      _value = [bbMikroInput1, bbMikroInput2];
      result = _value.reduce(min);
    } else if (decision1 == baInput1 && decision2 == baInput2) {
      _value = [baMikroInput1, baMikroInput2];
      result = _value.reduce(min);
    } else if (decision1 == baInput1 && decision2 == bbInput2) {
      _value = [baMikroInput1, bbMikroInput2];
      result = _value.reduce(min);
    }

    return result;
  }
}

class Centroid {
  int sigmaBawah;
  int sigmaAtas;
  double komposisiBawah;
  double komposisiAtas;
  int nBawah;
  int nAtas;

  Centroid(this.sigmaBawah, this.sigmaAtas, this.komposisiBawah,
      this.komposisiAtas, this.nBawah, this.nAtas);

  hitungCentroid() {
    var result =
    (((sigmaBawah * komposisiBawah) + (sigmaAtas * komposisiAtas)) /
        ((komposisiBawah * nBawah) + (komposisiAtas * nAtas)));
    return result;
  }
}