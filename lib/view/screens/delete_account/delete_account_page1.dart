import 'package:bookazon/resources/extensions/extensions.dart';
import 'package:bookazon/view/screens/delete_account/components/consts.dart';
import 'package:bookazon/view/widgets/public_button.dart';
import 'package:bookazon/view/widgets/public_text.dart';
import 'package:bookazon/view_model/delete_account/delete_account_cubit.dart';
import 'package:bookazon/view_model/delete_account/delete_account_state.dart';
import 'package:flutter/material.dart';
import 'package:bookazon/resources/localization/generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DeleteAccountPage extends StatelessWidget {
  const DeleteAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = DeleteAccountCubit.get(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: PublicText(txt: S.of(context).title_delete_account,size: 20.sp,fw: FontWeight.bold),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal:25),
          child: Column(
            children: [
              58.ph,
              PublicText(txt: S.of(context).why_delete_account,size: 20.sp,fw: FontWeight.w600,),
              41.ph,
              BlocBuilder<DeleteAccountCubit,DeleteAccountStates>(
                builder: (context, state) {
                  return SizedBox(
                    height: 248.h,
                    child: ListView.builder(
                      itemCount: listAnswer(context).length,
                      itemBuilder: (context, index) => Row(
                        children: [
                          Checkbox(
                            shape: const CircleBorder(),
                            value: listSelect[index],

                            onChanged: (value) {
                                cubit.changeIndex(index,value!);

                            },

                          ),
                          PublicText(txt: listAnswer(context)[index],size: 14.sp,fw: FontWeight.w400,)
                        ],
                      ),
                    ),
                  );
                },

              ),
              263.ph,
              PublicButton(
                  title: S.of(context).delete,
                  onPressed: (){})
            ],
          ),
        ),
      ),
    );
  }
}
