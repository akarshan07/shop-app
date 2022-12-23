import 'package:flutter/material.dart';

class UserProductItem extends StatelessWidget {

  final String title;
  final String imageUrl;

  UserProductItem({
    required this.title,
    required this.imageUrl,
});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(backgroundImage: NetworkImage(imageUrl),),
      title: Text(title),
      trailing: Container(
        width: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          IconButton(onPressed: (){}, icon: Icon(Icons.edit,color: Colors.purple,),),
          IconButton(onPressed: (){}, icon: Icon(Icons.delete,color: Theme.of(context).errorColor,),),
        ],),
      ),
    );
  }
}
