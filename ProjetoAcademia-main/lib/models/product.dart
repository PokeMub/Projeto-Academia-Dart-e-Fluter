import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:lojavirtual/models/item_size.dart';
import 'package:uuid/uuid.dart';

class Product extends ChangeNotifier {
  Product({
    this.id,
    this.nameAcademy,
    this.nameCriadorAcademy,
    this.cepAcademy,
    this.numeroCepAcademy,
    this.telefoneAcademy,
    this.linkInstagramAcademy,
    this.linkYoutubeAcademy,
    this.cNPJAcademy,
    this.notavideosAcademy,
    this.notaAcademy,
    this.bibiografiaAcademy,
    this.intrutorplanoumAcademy,
    this.intrutorplanodoisAcademy,
    this.intrutorplanotresAcademy,
    this.periodoplanotresAcademy,
    this.periodoplanodoisAcademy,
    this.periodoplanoumAcademy,
    this.qtdplanotresAcademy,
    this.qtdplanodoisAcademy,
    this.qtdplanoumAcademy,
    this.planotresvalorAcademy,
    this.planodoisvalorAcademy,
    this.planoumvalorAcademy,
    this.planotresnameAcademy,
    this.planodoisnameAcademy,
    this.planoumnameAcademy,
    this.complementoreferencia,
    this.images,
    this.alunos,
    this.nota,
    //  this.sizes
  }) {
    images = images ?? [];
    //   sizes = sizes ?? [];
  }

  Product.fromDocument(DocumentSnapshot document) {
    id = document.documentID;
    nota = document.data['nota'] as int;
    nameAcademy = document.data['nameAcademy'] as String;
    nameCriadorAcademy = document.data['nameCriadorAcademy'] as String;
    cepAcademy = document.data['cepAcademy'] as String;
    numeroCepAcademy = document.data['numeroCepAcademy'] as String;
    telefoneAcademy = document.data['telefoneAcademy'] as String;
    linkInstagramAcademy = document.data['linkInstagramAcademy'] as String;
    linkYoutubeAcademy = document.data['linkYoutubeAcademy'] as String;
    cNPJAcademy = document.data['cNPJAcademy'] as String;
    notavideosAcademy = document.data['notavideosAcademy'] as String;
    notaAcademy = document.data['notaAcademy'] as String;
    bibiografiaAcademy = document.data['bibiografiaAcademy'] as String;
    planoumnameAcademy = document.data['planoumnameAcademy'] as String;
    planodoisnameAcademy = document.data['planodoisnameAcademy'] as String;
    planotresnameAcademy = document.data['planotresnameAcademy'] as String;
    planoumvalorAcademy = document.data['planoumvalorAcademy'] as String;
    planodoisvalorAcademy = document.data['planodoisvalorAcademy'] as String;
    planotresvalorAcademy = document.data['planotresvalorAcademy'] as String;
    qtdplanoumAcademy = document.data['qtdplanoumAcademy'] as String;
    qtdplanodoisAcademy = document.data['qtdplanodoisAcademy'] as String;
    qtdplanotresAcademy = document.data['qtdplanotresAcademy'] as String;
    periodoplanoumAcademy = document.data['periodoplanoumAcademy'] as String;
    periodoplanodoisAcademy =
        document.data['periodoplanodoisAcademy'] as String;
    periodoplanotresAcademy =
        document.data['periodoplanotresAcademy'] as String;
    intrutorplanoumAcademy = document.data['intrutorplanoumAcademy'] as String;
    intrutorplanodoisAcademy =
        document.data['intrutorplanodoisAcademy'] as String;
    intrutorplanotresAcademy =
        document.data['intrutorplanotresAcademy'] as String;
    //////////////////////////////////////////////
    images = List<String>.from(document.data['imagens'] as List<dynamic>);
    alunos = List<String>.from(document.data['alunos'] as List<dynamic>);
/*   sizes = (document.data['planos'] as List<dynamic> ?? [])
        .map((s) => ItemSize.fromMap(s as Map<String, dynamic>))
        .toList();*/
    //print(sizes);
  }

  final Firestore firestore = Firestore.instance;
  final FirebaseStorage storage = FirebaseStorage.instance;

  DocumentReference get firestoreRef => firestore.document('academias/$id');
  StorageReference get storageRef => storage.ref().child('academias').child(id);

  String id; //
  int nota;
  String nameAcademy; //
  String nameCriadorAcademy; //
  String cepAcademy;
  String numeroCepAcademy;
  String telefoneAcademy;
  String linkInstagramAcademy;
  String linkYoutubeAcademy;
  String cNPJAcademy;
  String notavideosAcademy;
  String notaAcademy;
  String bibiografiaAcademy;
  String complementoreferencia;
  ///////////////////////////////////////////
  String intrutorplanoumAcademy;
  String intrutorplanodoisAcademy;
  String intrutorplanotresAcademy;
  //////////////////////////////////////////
  String periodoplanotresAcademy;
  String periodoplanodoisAcademy;
  String periodoplanoumAcademy;
  String qtdplanotresAcademy;
  String qtdplanodoisAcademy;
  String qtdplanoumAcademy;
  String planotresvalorAcademy;
  String planodoisvalorAcademy;
  String planoumvalorAcademy;
  String planotresnameAcademy;
  String planodoisnameAcademy;
  String planoumnameAcademy;
  /////////////////////////////////////////

  List<String> images;
  List<String> alunos;
  // List<ItemSize> sizes;

  List<dynamic> newImages;

  bool _loading = false;
  bool get loading => _loading;
  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  ItemSize _selectedSize;
  ItemSize get selectedSize => _selectedSize;
  set selectedSize(ItemSize value) {
    _selectedSize = value;
    notifyListeners();
  }

/*
  ItemSize findSize(String name) {
    try {
      return sizes.firstWhere((s) => s.planonameAcademy == name);
    } catch (e) {
      return null;
    }
  }*/

/*
  List<Map<String, dynamic>> exportSizeList() {
    return sizes.map((size) => size.toMap()).toList();
  }*/

  Future<void> save() async {
    loading = true;

    final Map<String, dynamic> data = {
      'id': id,
      'nameAcademy': nameAcademy,
      'nameCriadorAcademy': nameCriadorAcademy,
      'cepAcademy': cepAcademy,
      'numeroCepAcademy': numeroCepAcademy,
      'telefoneAcademy': telefoneAcademy,
      'linkInstagramAcademy': linkInstagramAcademy,
      'linkYoutubeAcademy ': linkYoutubeAcademy,
      'cNPJAcademy': cNPJAcademy,
      'notavideosAcademy ': notavideosAcademy,
      'notaAcademy': notaAcademy,
      'bibiografiaAcademy': bibiografiaAcademy,
      /////////////////////////////////////////////
      'planoumnameAcademy': planoumnameAcademy,
      'planodoisnameAcademy': planodoisnameAcademy,
      'planotresnameAcademy': planotresnameAcademy,
      ////////////////////////////////////////////
      'planoumvalorAcademy': planoumvalorAcademy,
      'planodoisvalorAcademy': planodoisvalorAcademy,
      'planotresvalorAcademy': planotresvalorAcademy,
      //////////////////////////////////////////////
      'qtdplanoumAcademy': qtdplanoumAcademy,
      'qtdplanodoisAcademy': qtdplanodoisAcademy,
      'qtdplanotresAcademy': qtdplanotresAcademy,
      //////////////////////////////////////////////
      'periodoplanoumAcademy': periodoplanoumAcademy,
      'periodoplanodoisAcademy': periodoplanodoisAcademy,
      'periodoplanotresAcademy': periodoplanotresAcademy,
      ///////////////////////////////////////////////
      'intrutorplanoumAcademy': intrutorplanoumAcademy,
      'intrutorplanodoisAcademy': intrutorplanodoisAcademy,
      'intrutorplanotresAcademy': intrutorplanotresAcademy,
      'nota': nota,
    };

    final doc = await firestore.collection('academias').document(id).get();

    if (doc.exists) {
      // final doc = await firestore.collection('academias').add(data);
      //await firestore.collection('academias').document(id).setData(data);
      print(data);
      await firestore.collection('academias').document(id).updateData(data);
    } else {
      print(data);
      await firestore.collection('academias').document(id).setData(data);
    }
/*
    final List<String> updateImages = [];
    for (final newImage in newImages) {
      if (images.contains(newImage)) {
        updateImages.add(newImage as String);
      } else {
        final StorageUploadTask task =
            storageRef.child(Uuid().v1()).putFile(newImage as File);
        final StorageTaskSnapshot snapshot = await task.onComplete;
        final String url = await snapshot.ref.getDownloadURL() as String;
        updateImages.add(url);
      }
    }
    for (final image in images) {
      if (!newImages.contains(image)) {
        try {
          final ref = await storage.getReferenceFromUrl(image);
          await ref.delete();
        } catch (e) {
          debugPrint('Falha ao deletar $image');
        }
      }
    }

    await firestoreRef.updateData({'imagens': updateImages});

    images = updateImages;
    */

    loading = false;
  }

  Product clone() {
    return Product(
      id: id,
      nameAcademy: nameAcademy,
      nameCriadorAcademy: nameCriadorAcademy,
      cepAcademy: cepAcademy,
      numeroCepAcademy: numeroCepAcademy,
      telefoneAcademy: telefoneAcademy,
      linkInstagramAcademy: linkInstagramAcademy,
      linkYoutubeAcademy: linkYoutubeAcademy,
      cNPJAcademy: cNPJAcademy,
      notavideosAcademy: notavideosAcademy,
      notaAcademy: notaAcademy,
      bibiografiaAcademy: bibiografiaAcademy,
      planoumnameAcademy: planoumnameAcademy,
      planodoisnameAcademy: planodoisnameAcademy,
      planotresnameAcademy: planotresnameAcademy,
      planoumvalorAcademy: planoumvalorAcademy,
      planodoisvalorAcademy: planodoisvalorAcademy,
      planotresvalorAcademy: planotresvalorAcademy,
      qtdplanoumAcademy: qtdplanoumAcademy,
      qtdplanodoisAcademy: qtdplanodoisAcademy,
      qtdplanotresAcademy: qtdplanotresAcademy,
      periodoplanoumAcademy: periodoplanoumAcademy,
      periodoplanodoisAcademy: periodoplanodoisAcademy,
      periodoplanotresAcademy: periodoplanotresAcademy,
      intrutorplanoumAcademy: intrutorplanoumAcademy,
      intrutorplanodoisAcademy: intrutorplanodoisAcademy,
      intrutorplanotresAcademy: intrutorplanotresAcademy,
      images: List.from(images),
      alunos: List.from(alunos),
      //  sizes: sizes.map((size) => size.clone()).toList(),
    );
  }

  @override
  String toString() {
    return 'Product{id: $id,alunos: $alunos, nameAcademy: $nameAcademy, cepAcademy: $cepAcademy, imagens: $images, newImages: $newImages, numeroCepAcademy: $numeroCepAcademy, telefoneAcademy: $telefoneAcademy,linkInstagramAcademy: $linkInstagramAcademy, linkYoutubeAcademy : $linkYoutubeAcademy,cNPJAcademy: $cNPJAcademy, notavideosAcademy : $notavideosAcademy, notaAcademy: $notaAcademy,bibiografiaAcademy: $bibiografiaAcademy, planoumnameAcademy: $planoumnameAcademy,planodoisnameAcademy: $planodoisnameAcademy, planotresnameAcademy: $planotresnameAcademy,planoumvalorAcademy: $planoumvalorAcademy,   planodoisvalorAcademy: $planodoisvalorAcademy,planotresvalorAcademy: $planotresvalorAcademy, qtdplanoumAcademy: $qtdplanoumAcademy,qtdplanodoisAcademy: $qtdplanodoisAcademy, qtdplanotresAcademy: $qtdplanotresAcademy,periodoplanoumAcademy: periodoplanoumAcademy, periodoplanodoisAcademy: $periodoplanodoisAcademy,periodoplanotresAcademy: $periodoplanotresAcademy,  intrutorplanoumAcademy: $intrutorplanoumAcademy,intrutorplanodoisAcademy: $intrutorplanodoisAcademy, intrutorplanotresAcademy: $intrutorplanotresAcademy}';
  }
}
/*
String toString() {
    return 'Product{id: $id, nameAcademy: $nameAcademy, cepAcademy: $cepAcademy, imagens: $images, sizes: $sizes, newImages: $newImages, numeroCepAcademy: $numeroCepAcademy, telefoneAcademy: $telefoneAcademy,linkInstagramAcademy: $linkInstagramAcademy, linkYoutubeAcademy : $linkYoutubeAcademy,cNPJAcademy: $cNPJAcademy, notavideosAcademy : $notavideosAcademy, notaAcademy: $notaAcademy,bibiografiaAcademy: $bibiografiaAcademy, planoumnameAcademy: $planoumnameAcademy,planodoisnameAcademy: $planodoisnameAcademy, planotresnameAcademy: $planotresnameAcademy,planoumvalorAcademy: $planoumvalorAcademy,   planodoisvalorAcademy: $planodoisvalorAcademy,planotresvalorAcademy: $planotresvalorAcademy, qtdplanoumAcademy: $qtdplanoumAcademy,qtdplanodoisAcademy: $qtdplanodoisAcademy, qtdplanotresAcademy: $qtdplanotresAcademy,periodoplanoumAcademy: periodoplanoumAcademy, periodoplanodoisAcademy: $periodoplanodoisAcademy,periodoplanotresAcademy: $periodoplanotresAcademy,  intrutorplanoumAcademy: $intrutorplanoumAcademy,intrutorplanodoisAcademy: $intrutorplanodoisAcademy, intrutorplanotresAcademy: $intrutorplanotresAcademy}';
  }
}*/



/*
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:lojavirtual/models/item_size.dart';

class Product extends ChangeNotifier {
  List<String> images;
  List<ItemSize> sizes;

  ItemSize _selectedSize;
  ItemSize get selectedSize => _selectedSize;
  set selectedSize(ItemSize value) {
    _selectedSize = value;
    notifyListeners();
  }

  String id; //
  String nameAcademy; //
  String nameCriadorAcademy; //
  String cepAcademy;
  String numeroCepAcademy;
  String telefoneAcademy;
  String linkInstagramAcademy;
  String linkYoutubeAcademy;
  String cNPJAcademy;
  String notavideosAcademy;
  String notaAcademy;
  String bibiografiaAcademy;

///////////////////////////////////////////
  bool intrutorplanoumAcademy;
  bool intrutorplanodoisAcademy;
  bool intrutorplanotresAcademy;

  String periodoplanotresAcademy;
  String periodoplanodoisAcademy;
  String periodoplanoumAcademy;

  String qtdplanotresAcademy;
  String qtdplanodoisAcademy;
  String qtdplanoumAcademy;

  String planotresvalorAcademy;
  String planodoisvalorAcademy;
  String planoumvalorAcademy;

  String planotresnameAcademy;
  String planodoisnameAcademy;
  String planoumnameAcademy;

  /////////////////////////////////////////
  String complementoreferencia;

  Product.fromDocument(DocumentSnapshot document) {
    id = document.documentID;
    nameAcademy = document.data['nameAcademy'] as String;
    nameCriadorAcademy = document.data['nameCriadorAcademy'] as String;
    cepAcademy = document.data['cepAcademy'] as String;
    numeroCepAcademy = document.data['numeroCepAcademy'] as String;
    telefoneAcademy = document.data['telefoneAcademy'] as String;
    linkInstagramAcademy = document.data['linkInstagramAcademy'] as String;
    linkYoutubeAcademy = document.data['linkYoutubeAcademy'] as String;
    cNPJAcademy = document.data['cNPJAcademy'] as String;
    notavideosAcademy = document.data['notavideosAcademy'] as String;
    notaAcademy = document.data['notaAcademy'] as String;
    bibiografiaAcademy = document.data['bibiografiaAcademy'] as String;

///////////////////////////////////////////////////////////////////////////

    planoumnameAcademy = document.data['planoumnameAcademy'] as String;
    planodoisnameAcademy = document.data['planodoisnameAcademy'] as String;
    planotresnameAcademy = document.data['planotresnameAcademy'] as String;

    planoumvalorAcademy = document.data['planoumvalorAcademy'] as String;
    planodoisvalorAcademy = document.data['planodoisvalorAcademy'] as String;
    planotresvalorAcademy = document.data['planotresvalorAcademy'] as String;

    qtdplanoumAcademy = document.data['qtdplanoumAcademy'] as String;
    qtdplanodoisAcademy = document.data['qtdplanodoisAcademy'] as String;
    qtdplanotresAcademy = document.data['qtdplanotresAcademy'] as String;

    periodoplanoumAcademy = document.data['periodoplanoumAcademy'] as String;
    periodoplanodoisAcademy =
        document.data['periodoplanodoisAcademy'] as String;
    periodoplanotresAcademy =
        document.data['periodoplanotresAcademy'] as String;

    intrutorplanoumAcademy = document.data['intrutorplanoumAcademy'] as bool;
    intrutorplanodoisAcademy =
        document.data['intrutorplanodoisAcademy'] as bool;
    intrutorplanotresAcademy =
        document.data['intrutorplanotresAcademy'] as bool;

    complementoreferencia = document.data['complementoreferencia'] as String;

    ////////////////////////////////////////////////////////////////////////
    ///
    images = List<String>.from(document.data['imagens'] as List<dynamic>);

    sizes = (document.data['planos'] as List<dynamic> ?? [])
        .map((s) => ItemSize.fromMap(s as Map<String, dynamic>))
        .toList();

    // print(sizes);
  }
}
*/