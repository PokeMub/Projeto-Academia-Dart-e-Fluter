import 'package:flutter/material.dart';
import 'package:lojavirtual/common/custom_icon_button.dart';
import 'package:lojavirtual/models/item_size.dart';
import 'package:lojavirtual/models/product.dart';

class EditItemSize extends StatelessWidget {
  const EditItemSize(
      {Key key, this.product, this.onRemove, this.onMoveUp, this.onMoveDown});

  final Product product;
  final VoidCallback onRemove;
  final VoidCallback onMoveUp;
  final VoidCallback onMoveDown;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[],
    );
  }
}
