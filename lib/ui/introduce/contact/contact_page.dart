import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_lehoang_extracare/resources/app_colors.dart';
import 'package:flutter_lehoang_extracare/resources/base/base_container.dart';
import 'package:flutter_lehoang_extracare/resources/component/common/common_top_bar.dart';
import 'package:flutter_lehoang_extracare/ui/introduce/contact/component/item_contact.dart';
import 'package:flutter_lehoang_extracare/ui/introduce/contact/contact_view_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ContactPage extends StatefulWidget {
  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  void initState() {
    super.initState();
    final viewModel = context.read(contactViewModel);
    viewModel.loadContactList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BaseContainer(
        provider: contactViewModel,
        child: Container(
          color: colorBackgroundDefault,
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              CommonTopbar('Liên hệ'),
              Expanded(child: _buildMainView()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMainView() {
    return Container(
      padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 15.h),
      child: HookBuilder(builder: (_) {
        final list = useProvider(contactViewModel.select((value) => value.contactList));
        if (list == null) return SizedBox();
        return ListView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: list.length,
          itemBuilder: (context, index) {
            final item = list[index];
            if (item == null) {
              return SizedBox();
            } else
              return ItemContact(item);
          },
        );
      }),
    );

  }
}
