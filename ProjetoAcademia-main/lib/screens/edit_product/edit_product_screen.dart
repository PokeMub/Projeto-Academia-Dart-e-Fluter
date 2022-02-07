import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lojavirtual/models/product.dart';
import 'package:lojavirtual/models/product_manager.dart';
import 'package:lojavirtual/models/user_manager.dart';
import 'package:lojavirtual/screens/edit_product/components/images_form.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class EditProductScreen extends StatefulWidget {
  EditProductScreen(Product p)
      : editing = p != null,
        product = p != null ? p.clone() : Product();

  Product product;
  bool editing;

  @override
  State<EditProductScreen> createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    return ChangeNotifierProvider.value(
      value: widget.product,
      child: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          title: Text(widget.editing ? 'Editar Academia' : 'Criar Academia'),
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        body: Form(
          key: formKey,
          child: ListView(
            children: <Widget>[
              ImagesForm(widget.product),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    TextFormField(
                      initialValue: widget.product.nameAcademy,
                      decoration: const InputDecoration(
                        hintText: 'Nome da Academia',
                        border: InputBorder.none,
                      ),
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                      validator: (name) {
                        if (name.length < 6)
                          return 'Nome da Academia muito curto';
                        return null;
                      },
                      onSaved: (name) => widget.product.nameAcademy = name,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Text(
                        widget.editing
                            ? 'Descrição'
                            : 'Dados Basicos para Criação de Academia',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    ),
                    TextFormField(
                      initialValue: widget.product.bibiografiaAcademy,
                      style: const TextStyle(fontSize: 16),
                      decoration: const InputDecoration(
                        hintText: 'Descrição da Academia',
                      ),
                      maxLines: null,
                      validator: (desc) {
                        if (desc.length < 10)
                          return 'Descrição da Academia muito curta';
                        return null;
                      },
                      onSaved: (desc) =>
                          widget.product.bibiografiaAcademy = desc,
                    ),
                    if (!widget.editing) ...[
                      TextFormField(
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          CnpjInputFormatter(),
                        ],
                        initialValue: widget.product.cNPJAcademy,
                        decoration: const InputDecoration(
                          hintText: 'Digite o CNPJ da Academia',
                        ),
                        style: TextStyle(fontSize: 16),
                        validator: (cnpj) {
                          if (cnpj.isEmpty) return 'Campo obrigatório';
                          return null;
                        },
                        onSaved: (cnpj) => widget.product.cNPJAcademy = cnpj,
                      ),
                    ],
                    TextFormField(
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        TelefoneInputFormatter(),
                      ],
                      initialValue: widget.product.telefoneAcademy,
                      decoration: const InputDecoration(
                        hintText: 'Digite o Telefone',
                      ),
                      style: TextStyle(fontSize: 16),
                      validator: (telefone) {
                        if (telefone.isEmpty) return 'Campo obrigatório';
                        return null;
                      },
                      onSaved: (telefone) =>
                          widget.product.telefoneAcademy = telefone,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Text(
                        widget.editing
                            ? 'Endereço'
                            : 'Informe a Localização da Academia',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    ),
                    TextFormField(
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        CepInputFormatter(),
                      ],
                      style: TextStyle(fontSize: 16),
                      initialValue: widget.product.cepAcademy,
                      decoration: const InputDecoration(
                          hintText: 'Digite O CEP da Academia'),
                      validator: (cep) {
                        if (cep.isEmpty) return 'Campo obrigatório';
                        return null;
                      },
                      onSaved: (cep) => widget.product.cepAcademy = cep,
                    ),
                    TextFormField(
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        CepInputFormatter(),
                      ],
                      style: TextStyle(fontSize: 16),
                      initialValue: widget.product.numeroCepAcademy,
                      decoration:
                          const InputDecoration(hintText: 'Nº/Lote/Apto/Casa'),
                      validator: (n) {
                        if (n.isEmpty) return 'Campo obrigatório';
                        return null;
                      },
                      onSaved: (n) => widget.product.numeroCepAcademy = n,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Text(
                        widget.editing
                            ? 'Redes Sociais'
                            : 'Informe a Redes Sociais da Academia (*não obrigatorio)',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    ),
                    TextFormField(
                      style: TextStyle(fontSize: 16),
                      initialValue: widget.product.linkInstagramAcademy,
                      decoration: const InputDecoration(hintText: 'Instagram'),
                      validator: (insta) {
                        return null;
                      },
                      onSaved: (insta) =>
                          widget.product.linkInstagramAcademy = insta,
                    ),
                    TextFormField(
                      style: TextStyle(fontSize: 16),
                      initialValue: widget.product.linkYoutubeAcademy,
                      decoration: const InputDecoration(hintText: 'Youtube'),
                      validator: (youtube) {
                        return null;
                      },
                      onSaved: (youtube) =>
                          widget.product.linkYoutubeAcademy = youtube,
                    ),
                    //////////////////////////////////////////
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Text(
                        widget.editing ? 'Plano 1' : 'Criação do Plano 1',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    ),

                    TextFormField(
                      style: TextStyle(fontSize: 16),
                      initialValue: widget.product.qtdplanoumAcademy,
                      decoration: const InputDecoration(
                          labelText: 'Quantidades de Dias por Semana'),
                      validator: (qtd) {
                        if (qtd.isEmpty) return 'Campo obrigatório';
                        return null;
                      },
                      onSaved: (qtd) => widget.product.qtdplanoumAcademy = qtd,
                    ),
                    TextFormField(
                      style: TextStyle(fontSize: 16),
                      initialValue: widget.product.periodoplanoumAcademy,
                      decoration: const InputDecoration(labelText: 'Periodo'),
                      validator: (periodo) {
                        if (periodo.isEmpty) return 'Campo obrigatório';
                        return null;
                      },
                      onSaved: (periodo) =>
                          widget.product.periodoplanoumAcademy = periodo,
                    ),
                    TextFormField(
                      style: TextStyle(fontSize: 16),
                      initialValue: widget.product.intrutorplanoumAcademy,
                      decoration: const InputDecoration(
                          labelText: 'Instrutor(Personal Trainner)'),
                      validator: (instrutor) {
                        if (instrutor.isEmpty) return 'Campo obrigatório';
                        return null;
                      },
                      onSaved: (instrutor) =>
                          widget.product.intrutorplanoumAcademy = instrutor,
                    ),
                    TextFormField(
                      initialValue: widget.product.planoumvalorAcademy,
                      decoration: const InputDecoration(
                          labelText: 'Preço', prefixText: 'R\$'),
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      validator: (price) {
                        if (num.tryParse(price) == null) return 'Inválido';
                        return null;
                      },
                      onChanged: (price) =>
                          widget.product.planoumvalorAcademy = price,
                    ),
                    //////////////////////////////////////////////////
                    ///
                    //////////////////////////////////////////
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Text(
                        widget.editing ? 'Plano 2' : 'Criação do Plano 2',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    ),

                    TextFormField(
                      style: TextStyle(fontSize: 16),
                      initialValue: widget.product.qtdplanodoisAcademy,
                      decoration: const InputDecoration(
                          labelText: 'Quantidades de Dias por Semana'),
                      validator: (qtd2) {
                        if (qtd2.isEmpty) return 'Campo obrigatório';
                        return null;
                      },
                      onSaved: (qtd2) =>
                          widget.product.qtdplanodoisAcademy = qtd2,
                    ),
                    TextFormField(
                      style: TextStyle(fontSize: 16),
                      initialValue: widget.product.periodoplanoumAcademy,
                      decoration: const InputDecoration(labelText: 'Periodo'),
                      validator: (periodo2) {
                        if (periodo2.isEmpty) return 'Campo obrigatório';
                        return null;
                      },
                      onSaved: (periodo2) =>
                          widget.product.periodoplanodoisAcademy = periodo2,
                    ),
                    TextFormField(
                      style: TextStyle(fontSize: 16),
                      initialValue: widget.product.intrutorplanodoisAcademy,
                      decoration: const InputDecoration(
                          labelText: 'Instrutor(Personal Trainner)'),
                      validator: (instrutor2) {
                        if (instrutor2.isEmpty) return 'Campo obrigatório';
                        return null;
                      },
                      onSaved: (instrutor2) =>
                          widget.product.intrutorplanodoisAcademy = instrutor2,
                    ),
                    TextFormField(
                      initialValue: widget.product.planodoisvalorAcademy,
                      decoration: const InputDecoration(
                          labelText: 'Preço', prefixText: 'R\$'),
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      validator: (price2) {
                        if (num.tryParse(price2) == null) return 'Inválido';
                        return null;
                      },
                      onChanged: (price2) =>
                          widget.product.planodoisvalorAcademy = price2,
                    ),
                    //////////////////////////////////////////
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Text(
                        widget.editing ? 'Plano 3' : 'Criação do Plano 3',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    ),

                    TextFormField(
                      style: TextStyle(fontSize: 16),
                      initialValue: widget.product.qtdplanotresAcademy,
                      decoration: const InputDecoration(
                          labelText: 'Quantidades de Dias por Semana'),
                      validator: (qtd3) {
                        if (qtd3.isEmpty) return 'Campo obrigatório';
                        return null;
                      },
                      onSaved: (qtd3) =>
                          widget.product.qtdplanotresAcademy = qtd3,
                    ),
                    TextFormField(
                      style: TextStyle(fontSize: 16),
                      initialValue: widget.product.periodoplanotresAcademy,
                      decoration: const InputDecoration(labelText: 'Periodo'),
                      validator: (periodo3) {
                        if (periodo3.isEmpty) return 'Campo obrigatório';
                        return null;
                      },
                      onSaved: (periodo3) =>
                          widget.product.periodoplanotresAcademy = periodo3,
                    ),
                    TextFormField(
                      style: TextStyle(fontSize: 16),
                      initialValue: widget.product.intrutorplanotresAcademy,
                      decoration: const InputDecoration(
                          labelText: 'Instrutor(Personal Trainner)'),
                      validator: (instrutor3) {
                        if (instrutor3.isEmpty) return 'Campo obrigatório';
                        return null;
                      },
                      onSaved: (instrutor3) =>
                          widget.product.intrutorplanotresAcademy = instrutor3,
                    ),
                    TextFormField(
                      initialValue: widget.product.planotresvalorAcademy,
                      decoration: const InputDecoration(
                          labelText: 'Preço', prefixText: 'R\$'),
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      validator: (price3) {
                        if (num.tryParse(price3) == null) return 'Inválido';
                        return null;
                      },
                      onChanged: (price3) =>
                          widget.product.planotresvalorAcademy = price3,
                    ),

/*
                    Row(children: <Widget>[
                      Expanded(
                        flex: 16,
                        child: Text(
                          product.planoumnameAcademy,
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Expanded(
                        flex: 30,
                        child: TextFormField(
                          initialValue: product.qtdplanoumAcademy.toString(),
                          decoration: const InputDecoration(
                            labelText: 'QTD de Dias',
                            isDense: true,
                          ),
                          keyboardType: TextInputType.name,
                          validator: (stock) {
                            if (stock == null) return 'Inválido';
                            return null;
                          },
                          onChanged: (stock) =>
                              product.qtdplanoumAcademy = stock,
                        ),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Expanded(
                        flex: 20,
                        child: TextFormField(
                          initialValue:
                              product.periodoplanoumAcademy.toString(),
                          decoration: const InputDecoration(
                            labelText: 'Periodo',
                            isDense: true,
                          ),
                          keyboardType: TextInputType.name,
                          validator: (stocks) {
                            if (stocks == null) return 'Inválido';
                            return null;
                          },
                          onChanged: (stocks) =>
                              product.periodoplanoumAcademy = stocks,
                        ),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Expanded(
                        flex: 15,
                        child: TextFormField(
                          initialValue:
                              product.intrutorplanoumAcademy.toString(),
                          decoration: const InputDecoration(
                            labelText: 'Instrutor',
                            isDense: true,
                          ),
                          keyboardType: TextInputType.name,
                          validator: (stockss) {
                            if (stockss == null) return 'Inválido';
                            return null;
                          },
                          onChanged: (stockss) =>
                              product.intrutorplanoumAcademy = stockss as bool,
                        ),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Expanded(
                        flex: 20,
                        child: TextFormField(
                          initialValue: product.planoumvalorAcademy,
                          decoration: const InputDecoration(
                              labelText: 'Preço',
                              isDense: true,
                              prefixText: 'R\$'),
                          keyboardType: const TextInputType.numberWithOptions(
                              decimal: true),
                          validator: (price) {
                            if (num.tryParse(price) == null) return 'Inválido';
                            return null;
                          },
                          onChanged: (price) =>
                              product.planoumvalorAcademy = price,
                        ),
                      ),
                    ]),
                    
                    //////////////////////////////////////////////////////
                    Row(
                      children: <Widget>[
                        Expanded(
                          flex: 16,
                          child: Text(
                            product.planodoisnameAcademy,
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Expanded(
                          flex: 30,
                          child: TextFormField(
                            initialValue:
                                product.qtdplanodoisAcademy.toString(),
                            decoration: const InputDecoration(
                              labelText: 'QTD de Dias',
                              isDense: true,
                            ),
                            keyboardType: TextInputType.name,
                            validator: (stock) {
                              if (stock == null) return 'Inválido';
                              return null;
                            },
                            onChanged: (stock) =>
                                product.qtdplanodoisAcademy = stock,
                          ),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Expanded(
                          flex: 20,
                          child: TextFormField(
                            initialValue:
                                product.periodoplanodoisAcademy.toString(),
                            decoration: const InputDecoration(
                              labelText: 'Periodo',
                              isDense: true,
                            ),
                            keyboardType: TextInputType.name,
                            validator: (stocks) {
                              if (stocks == null) return 'Inválido';
                              return null;
                            },
                            onChanged: (stocks) =>
                                product.periodoplanodoisAcademy = stocks,
                          ),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Expanded(
                          flex: 15,
                          child: TextFormField(
                            initialValue:
                                product.intrutorplanodoisAcademy.toString(),
                            decoration: const InputDecoration(
                              labelText: 'Instrutor',
                              isDense: true,
                            ),
                            keyboardType: TextInputType.name,
                            validator: (stockss) {
                              if (stockss == null) return 'Inválido';
                              return null;
                            },
                            onChanged: (stockss) => product
                                .intrutorplanodoisAcademy = stockss as bool,
                          ),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Expanded(
                          flex: 20,
                          child: TextFormField(
                            initialValue: product.planodoisvalorAcademy,
                            decoration: const InputDecoration(
                                labelText: 'Preço',
                                isDense: true,
                                prefixText: 'R\$'),
                            keyboardType: const TextInputType.numberWithOptions(
                                decimal: true),
                            validator: (price) {
                              if (num.tryParse(price) == null)
                                return 'Inválido';
                              return null;
                            },
                            onChanged: (price) =>
                                product.planodoisvalorAcademy = price,
                          ),
                        ),
                      ],
                    ),

                    ///////////////////////////////////////////////////////
                    Row(
                      children: <Widget>[
                        Expanded(
                          flex: 16,
                          child: Text(
                            product.planotresnameAcademy,
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Expanded(
                          flex: 30,
                          child: TextFormField(
                            initialValue:
                                product.qtdplanotresAcademy.toString(),
                            decoration: const InputDecoration(
                              labelText: 'QTD de Dias',
                              isDense: true,
                            ),
                            keyboardType: TextInputType.name,
                            validator: (stock) {
                              if (stock == null) return 'Inválido';
                              return null;
                            },
                            onChanged: (stock) =>
                                product.qtdplanotresAcademy = stock,
                          ),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Expanded(
                          flex: 20,
                          child: TextFormField(
                            initialValue:
                                product.periodoplanotresAcademy.toString(),
                            decoration: const InputDecoration(
                              labelText: 'Periodo',
                              isDense: true,
                            ),
                            keyboardType: TextInputType.name,
                            validator: (stocks) {
                              if (stocks == null) return 'Inválido';
                              return null;
                            },
                            onChanged: (stocks) =>
                                product.periodoplanotresAcademy = stocks,
                          ),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Expanded(
                          flex: 15,
                          child: TextFormField(
                            initialValue:
                                product.intrutorplanotresAcademy.toString(),
                            decoration: const InputDecoration(
                              labelText: 'Instrutor',
                              isDense: true,
                            ),
                            keyboardType: TextInputType.name,
                            validator: (stockss) {
                              if (stockss == null) return 'Inválido';
                              return null;
                            },
                            onChanged: (stockss) => product
                                .intrutorplanotresAcademy = stockss as bool,
                          ),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Expanded(
                          flex: 20,
                          child: TextFormField(
                            initialValue: product.planotresvalorAcademy,
                            decoration: const InputDecoration(
                                labelText: 'Preço',
                                isDense: true,
                                prefixText: 'R\$'),
                            keyboardType: const TextInputType.numberWithOptions(
                                decimal: true),
                            validator: (price) {
                              if (num.tryParse(price) == null)
                                return 'Inválido';
                              return null;
                            },
                            onChanged: (price) =>
                                product.planotresvalorAcademy = price,
                          ),
                        ),
                      ],
                    ),
                    */

                    const SizedBox(
                      height: 20,
                    ),
                    Consumer<UserManager>(
                      builder: (_, userManager, __) {
                        return SizedBox(
                          height: 44,
                          // ignore: deprecated_member_use
                          child: RaisedButton(
                            onPressed: !widget.product.loading
                                ? () async {
                                    if (formKey.currentState.validate()) {
                                      formKey.currentState.save();

                                      if (widget.product.id == null) {
                                        widget.product.id = userManager.user.id;
                                        widget.product.nameCriadorAcademy =
                                            userManager.user.name;
                                        widget.product.planoumnameAcademy =
                                            'Plano 1';
                                        widget.product.planodoisnameAcademy =
                                            'Plano 2';
                                        widget.product.planotresnameAcademy =
                                            'Plano 3';
                                      }

                                      await widget.product.save();

                                      /*  context
                                          .read<ProductManager>()
                                          .update(product);*/

                                      // productManager.loadAllProducts();
                                      //  Navigator.of(context).pop();

                                      userManager.criarimagemacademia(
                                          onFail: (e) {
                                        scaffoldKey.currentState
                                            // ignore: deprecated_member_use
                                            .showSnackBar(SnackBar(
                                          content: Text('Falha ao Salvar: $e'),
                                          backgroundColor: Colors.red,
                                        ));
                                      }, onSuccess: () {
                                        context
                                            .read<ProductManager>()
                                            .update(widget.product);
                                        Navigator.of(context).pop();
                                      });

                                      //  await product.save();

                                      //  context
                                      //    .read<ProductManager>()
                                      //    .update(product);

                                      // Navigator.of(context).pop();

                                    }
                                  }
                                : null,
                            textColor: Colors.white,
                            color: primaryColor,
                            disabledColor: primaryColor.withAlpha(100),
                            child: widget.product.loading
                                ? CircularProgressIndicator(
                                    valueColor:
                                        AlwaysStoppedAnimation(Colors.white),
                                  )
                                : const Text(
                                    'Salvar',
                                    style: TextStyle(fontSize: 18.0),
                                  ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
