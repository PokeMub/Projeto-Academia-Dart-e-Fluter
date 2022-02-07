import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lojavirtual/common/custom_drawer/custom_drawer.dart';
import 'package:lojavirtual/models/user_manager.dart';
import 'package:provider/provider.dart';
import 'package:auto_size_text/auto_size_text.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double tamanho = MediaQuery.of(context).size.height * 0.04;
    // double alturatela = MediaQuery.of(context).size.width / 10;
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Perfil'),
      ),
      body: Consumer<UserManager>(
        builder: (_, userManager, __) {
          return SingleChildScrollView(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: tamanho),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 80,
                        backgroundImage: NetworkImage(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQGrQoGh518HulzrSYOTee8UO517D_j6h4AYQ&usqp=CAU"),
                      ),
                    ],
                  ),
                  SizedBox(height: tamanho),
                  Row(
                    children: [
                      Icon(
                        Icons.perm_identity,
                        color: Colors.white,
                      ),
                      Text(
                        " Nome: ",
                        maxLines: 2,
                        style: const TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.70,
                        child: AutoSizeText("${userManager.user.name}",
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.white,
                              fontSize: 22,
                            ),
                            minFontSize: 5,
                            maxLines: 1),
                      ),
                    ],
                  ),
                  SizedBox(height: tamanho),
                  Row(
                    children: [
                      Icon(Icons.email, color: Colors.white),
                      Text(
                        " Email: ",
                        // maxLines: 2,
                        style: const TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.70,
                        child: AutoSizeText("${userManager.user.email}",
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.white,
                              fontSize: 22,
                            ),
                            minFontSize: 5,
                            maxLines: 1),
                      ),
                    ],
                  ),
                  SizedBox(height: tamanho),
                  Row(
                    children: [
                      Icon(Icons.credit_card, color: Colors.white),
                      Text(
                        " CPF: ",
                        maxLines: 2,
                        style: const TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.70,
                        child: AutoSizeText(
                            '${userManager.user?.cpf ?? 'Atualizar o Cadastro ...'}',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.white,
                              fontSize: 22,
                            ),
                            minFontSize: 5,
                            maxLines: 1),
                      ),
                    ],
                  ),
                  SizedBox(height: tamanho),
                  Row(
                    children: [
                      Icon(Icons.phone_enabled, color: Colors.white),
                      Text(
                        " Telefone: ",
                        style: const TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.60,
                        child: AutoSizeText(
                            '${userManager.user?.telefone ?? 'Atualizar o Cadastro ...'}',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.white,
                              fontSize: 16,
                            ),
                            minFontSize: 5,
                            maxLines: 1),
                      ),
                    ],
                  ),
                  SizedBox(height: tamanho),
                  Row(
                    children: [
                      Icon(Icons.bloodtype, color: Colors.white),
                      Text(
                        " Tipo Sanguíneo: ",
                        style: const TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.40,
                        child: AutoSizeText(
                            '${userManager.user?.tiposanguinio ?? 'Atualizar o Cadastro ...'}',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.white,
                              fontSize: 20,
                            ),
                            minFontSize: 5,
                            maxLines: 1),
                      ),
                    ],
                  ),
                  SizedBox(height: tamanho),
                  Row(
                    children: [
                      Icon(Icons.apartment, color: Colors.white),
                      Text(
                        " CEP: ",
                        style: const TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.70,
                        child: AutoSizeText(
                            '${userManager.user?.cep ?? 'Atualizar o Cadastro ...'}',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.white,
                              fontSize: 16,
                            ),
                            minFontSize: 5,
                            maxLines: 1),
                      ),
                    ],
                  ),
                  SizedBox(height: tamanho),
                  Row(
                    children: [
                      Icon(Icons.face_sharp, color: Colors.white),
                      Text(
                        " Sexo: ",
                        style: const TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.70,
                        child: AutoSizeText(
                            '${userManager.user?.sexo ?? 'Atualizar o Cadastro ...'}',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.white,
                              fontSize: 16,
                            ),
                            minFontSize: 5,
                            maxLines: 1),
                      ),
                    ],
                  ),
                  SizedBox(height: tamanho),
                  Row(
                    children: [
                      Icon(Icons.cake, color: Colors.white),
                      Text(
                        " Data de Nascimento: ",
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.40,
                        child: AutoSizeText(
                            '${userManager.user?.datadenascimento ?? 'Atualizar o Cadastro ...'}',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.white,
                              fontSize: 16,
                            ),
                            minFontSize: 5,
                            maxLines: 1),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}



/*
Row(
                      children: [
                        CircleAvatar(
                            radius: 80,
                            backgroundImage: showLocalFile
                                ? FileImage(imageFile) as ImageProvider
                                : userModel.profileImage == ''
                                    ? const NetworkImage(
                                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQGrQoGh518HulzrSYOTee8UO517D_j6h4AYQ&usqp=CAU')
                                        https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR65SKVC2NBfeCe8UTSico7xN9HybdIrM8Zqg&usqp=CAU
                                        
                                    : NetworkImage(userModel.profileImage)),
                        IconButton(
                          icon: const Icon(Icons.camera_alt),
                          onPressed: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        ListTile(
                                          leading: const Icon(Icons.image),
                                          title: const Text('From Gallery'),
                                          onTap: () {
                                            _pickImageFromGallery();
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                        ListTile(
                                          leading: const Icon(Icons.camera_alt),
                                          title: const Text('From Camera'),
                                          onTap: () {
                                            _pickImageFromCamera();
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    ),
                                  );
                                });
                          },
                        ),
                      ],
                    ),
                    */
