import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/constants.dart';
import 'package:store_app/core/utils/app_router.dart';
import 'package:store_app/core/utils/cache_helper.dart';
import 'package:store_app/core/widgets/custom_name_bio_view.dart';
import 'package:store_app/features/settings/presentation/view_models/setting_cubit/setting_cubit.dart';

class AccountView extends StatelessWidget {
  const AccountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingCubit, SettingState>(
      builder: (context, state) {
        if (state is GetProfileSuccess) {
          return InkWell(
            onTap: () {
              AppRouter.router
                  .push(AppRouter.kEditProfileView, extra: state.response.data);
            },
            splashColor: Colors.transparent,
            highlightColor: Colors.grey[100],
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.grey[300],
                  radius: 25,
                  child: CachedNetworkImage(
                    imageUrl: CacheHelper.getData(key: 'user')['image'],
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                NameAndBio(
                  name: CacheHelper.getData(key: 'user')['name'],
                  email: CacheHelper.getData(key: 'user')['email'],
                ),
                const Spacer(),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.grey[600],
                ),
              ],
            ),
          );
        } else {
          return Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey[300],
                radius: 25,
                child: CachedNetworkImage(
                  imageUrl: CacheHelper.getData(key: kImage),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              NameAndBio(
                name: CacheHelper.getData(key: kName),
                email: CacheHelper.getData(key: kEmail),
              ),
              const Spacer(),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey[600],
              ),
            ],
          );
        }
      },
    );
  }
}
