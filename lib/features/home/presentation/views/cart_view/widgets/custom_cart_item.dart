import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:store_app/constants.dart';
import 'package:store_app/core/utils/styles.dart';

class CustomCartItem extends StatelessWidget {
  const CustomCartItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: const ValueKey(0),
      startActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {},
            backgroundColor: const Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            autoClose: true,
            borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(20),
                topRight: Radius.circular(20)),
            icon: Icons.delete,
            label: 'Delete',
          ),
        ],
      ),
      child: Row(
        children: [
          Image.network(
            testImg,
            height: 80,
            width: 80,
          ),
          const SizedBox(
            width: 20,
          ),
          const Expanded(child: NameAndCountOfItem()),
          const Spacer(),
          Text("25000 LE",
              style: Styles.textStyle18.copyWith(color: kMainColor)),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }
}

class NameAndCountOfItem extends StatelessWidget {
  const NameAndCountOfItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Iphone',
          style: Styles.textStyle20.copyWith(fontSize: 22),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          'Quantity : 1',
          style: Styles.textStyle18.copyWith(fontSize: 15),
        ),
      ],
    );
  }
}
