import 'package:flutter/material.dart';

class CategoryRowList extends StatelessWidget {
  final IconData cateIcon;
  final String cateLabel;
  const CategoryRowList({
    super.key,
    required this.cateIcon,
    required this.cateLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.2,
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.grey[200]),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            child: Icon(cateIcon, size: 20),
          ),
          Container(
              padding: const EdgeInsets.all(8),
              child: Text(
                cateLabel,
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              ))
        ],
      ),
    );
  }
}
