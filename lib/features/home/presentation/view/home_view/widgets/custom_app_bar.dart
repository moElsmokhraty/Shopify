import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/constants.dart';
import 'package:store_app/core/utils/AssetsApp.dart';
import 'package:store_app/features/home/presentation/view_models/search_cubit/search_cubit.dart';
import 'package:badges/badges.dart' as badges;

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        FocusNode focusNode = FocusNode();
        return Padding(
          padding:
              const EdgeInsetsDirectional.only(start: 25, end: 25, bottom: 10),
          child: Row(
            children: [
              SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width * 0.6,
                child: TextField(
                  onTapOutside: (event) {
                    FocusScope.of(context).unfocus();
                  },

                  autofocus: false,
                  cursorColor: kMainColor,
                  style: const TextStyle(color: kMainColor),
                  onChanged: (value) {},
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: kMainColor,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    hoverColor: kMainColor,
                    hintText: "Search...",
                    hintStyle: TextStyle(
                      color: Colors.grey[500],
                    ),
                    prefixIcon: Image.asset(
                      AssetsApp.searchIcon,
                      color: Colors.grey[400],
                    ),
                  ),
                ),
              ),
              const Spacer(),
              badges.Badge(
                badgeContent: const Text("6"),
                child: SizedBox(
                  height: 30,
                  width: 28,
                  child: Image.asset(
                    AssetsApp.shoppingBagIcon,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              badges.Badge(
                badgeContent: const Text("9"),
                child: SizedBox(
                  height: 35,
                  width: 32,
                  child: Image.asset(
                    AssetsApp.messageIcon2,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
