import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_lehoang_extracare/data/provider/provider.dart';
import 'package:flutter_lehoang_extracare/gen/assets.gen.dart';
import 'package:flutter_lehoang_extracare/resources/app_colors.dart';
import 'package:flutter_lehoang_extracare/resources/app_decorations.dart';
import 'package:flutter_lehoang_extracare/resources/app_textstyle.dart';
import 'package:flutter_lehoang_extracare/resources/base/base_container.dart';
import 'package:flutter_lehoang_extracare/resources/base/base_webview.dart';
import 'package:flutter_lehoang_extracare/resources/component/button/button_grey.dart';
import 'package:flutter_lehoang_extracare/resources/component/button/button_solid.dart';
import 'package:flutter_lehoang_extracare/resources/component/common/common_top_bar.dart';
import 'package:flutter_lehoang_extracare/resources/component/image/shimmer_loading_image.dart';
import 'package:flutter_lehoang_extracare/ui/challenge/challenge_view_model.dart';
import 'package:flutter_lehoang_extracare/ui/challenge/dialog_answer_success.dart';
import 'package:flutter_lehoang_extracare/ui/challenge/item_answer.dart';
import 'package:flutter_lehoang_extracare/utils/util/toast_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../constants.dart';

class ChallengePage extends StatefulWidget {
  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> with BaseWebView {
  @override
  void initState() {
    super.initState();
    final viewModel = context.read(challengeViewModel);
    viewModel.doWithLoadingMulti([viewModel.loadQuestion(), viewModel.loadChallengeHelp()]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BaseContainer(
        provider: challengeViewModel,
        child: Container(
          color: colorBackgroundDefault,
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              CommonTopbar('Thử thách'),
              Expanded(
                child: Column(
                  children: [
                    _buildTopView(),
                    Expanded(child: _buildMainView()),
                  ],
                ),
              ),
              _buildBottomButton()
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopView() {
    return Stack(
      children: [
        HookBuilder(builder: (_) {
          final challengeHelp = useProvider(challengeViewModel.select((value) => value.challengeHelp));
          final link = challengeHelp?.image_url;
          if (link == null || link.isEmpty) {
            return Assets.images.icChallengeQuestion.image(width: 0.8.sw, height: 250.h, fit: BoxFit.cover);
          }
          return ShimmerLoadingImage(
              imageUrl: challengeHelp?.image_url, height: 250.h, width: double.infinity, fit: BoxFit.cover);
        }),
        // Assets.images.icChallengeQuestion.image(width: double.infinity, height: 250.h, fit: BoxFit.cover),
        Container(
            height: 250.h,
            padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 15.h, bottom: 15.h),
            child: Stack(
              children: [
                Positioned(
                  bottom: 10.h,
                  left: 5.w,
                  right: 5.w,
                  child: Container(
                    decoration: decorSolidRound(circularSize: 10.r, color: Colors.white, isShadow: true),
                    padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 20.h, bottom: 20.h),
                    child: Row(
                      children: [
                        Expanded(child: Text('Thử thách hàng ngày:')),
                        Icon(Icons.star, color: Colors.red, size: 20.h),
                        SizedBox(width: 5.w),
                        HookBuilder(builder: (_) {
                          final survey = useProvider(challengeViewModel.select((value) => value.survey));
                          return Text('${survey?.data?[0].point ?? 0}đ',
                              maxLines: 1, overflow: TextOverflow.ellipsis, style: styleTextRedBold());
                        }),
                      ],
                    ),
                  ),
                ),
              ],
            ))
      ],
    );
  }

  Widget _buildMainView() {
    return HookBuilder(builder: (_) {
      final challengeHelp = useProvider(challengeViewModel.select((value) => value.challengeHelp));
      if (challengeHelp?.body == null) return SizedBox();
      return Container(
          color: Colors.white,
          padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h, bottom: 20.h),
          child: buildWebView(htmlStr: challengeHelp?.body));
    });
  }

  Widget _buildBottomButton() {
    return HookBuilder(builder: (_) {
      final question = useProvider(challengeViewModel.select((value) => value.currentQuestion));
      if (question != null) {
        return Container(
          color: Colors.white,
          padding: EdgeInsets.only(left: 15.w, right: 15.w, bottom: 13.h, top: 13.h),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5.r),
            child: Material(
              color: colorPrimary,
              child: InkWell(
                onTap: _showQuestionDetail,
                child: Padding(
                  padding: EdgeInsets.only(left: 15.w, right: 15.w, bottom: 12.h, top: 12.h),
                  child: Row(
                    children: [
                      Expanded(
                          child: Text(
                        'Bắt đầu',
                        style: styleTextWhiteBold(),
                        textAlign: TextAlign.center,
                      ))
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      } else
        return Container(
          color: Colors.white,
          padding: EdgeInsets.only(left: 15.w, right: 15.w, bottom: 13.h, top: 13.h),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5.r),
            child: Material(
              color: colorGrey2,
              child: InkWell(
                child: Padding(
                  padding: EdgeInsets.only(left: 15.w, right: 15.w, bottom: 12.h, top: 12.h),
                  child: Row(
                    children: [
                      Expanded(
                          child: Text(
                        'Hiện không có câu hỏi nào',
                        style: styleTextBlackBold(),
                        textAlign: TextAlign.center,
                      ))
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
    });
  }

  void _showQuestionDetail() {
    final isLogged = context.read(prefsProvider).getUser() != null;
    if (!isLogged) {
      showToast(context: context, message: "Bạn phải đăng nhập để sử dụng tính năng này");
      Navigator.of(context, rootNavigator: true).pushNamedAndRemoveUntil(Constants.pageLogin, (route) => false);
      return;
    }

    final question = context.read(challengeViewModel).currentQuestion;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(30.r), topRight: Radius.circular(30.r)),
      ),
      backgroundColor: Colors.white,
      builder: (_) => Container(
        width: double.infinity,
        padding: EdgeInsets.only(top: 20.h, left: 15.w, right: 15.w, bottom: 50.h),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(question?.name ?? 'Không có tiêu đề', style: styleTextBlackBold()),
              SizedBox(height: 15.h),
              Text(question?.body ?? 'Không có nội dung', style: styleTextBlack()),
              SizedBox(height: 15.h),
              HookBuilder(builder: (_) {
                final question = useProvider(challengeViewModel.select((value) => value.currentQuestion));
                final selectedAnswerId =
                    useProvider(challengeViewModel.select((value) => value.currentSelectedAnswerId));
                final listAnswer = question?.multi_answer;
                if (listAnswer == null || listAnswer.isEmpty) return SizedBox();
                return ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: listAnswer.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        context.read(challengeViewModel).setSelectedAnswer(listAnswer[index].id);
                      },
                      child: ItemAnswer(answer: listAnswer[index], selectedAnswerId: selectedAnswerId),
                    );
                  },
                );
              }),
              SizedBox(height: 15.h),
              HookBuilder(builder: (_) {
                final index = useProvider(challengeViewModel.select((value) => value.index));
                final questionList = useProvider(challengeViewModel.select((value) => value.questionList));
                if (index == ((questionList?.length ?? 0) - 1))
                  return ButtonSolid(text: 'Gửi câu trả lời', onPress: _sendAnswer);
                else
                  return ButtonSolid(text: 'Tiếp theo', onPress: _toNextQuestion);
              }),
              SizedBox(height: 15.h),
              HookBuilder(builder: (_) {
                final index = useProvider(challengeViewModel.select((value) => value.index));
                final questionList = useProvider(challengeViewModel.select((value) => value.questionList));
                if (index == 0)
                  return SizedBox();
                else
                  return ButtonGrey(text: 'Quay lại', onPress: _backToPreviousQuestion);
              }),
            ],
          ),
        ),
      ),
    );
  }

  void _toNextQuestion() {
    final viewModel = context.read(challengeViewModel);
    if (viewModel.currentSelectedAnswerId == null) {
      showToast(context: context, message: 'Hãy chọn câu trả lời');
      return;
    }
    if (viewModel.nextQuestion()) {
      Navigator.maybePop(context);
      Future.delayed(Duration(milliseconds: 20), () {
        _showQuestionDetail();
      });
    } else {
      // Đã xong câu hỏi cuối cùng
      _sendAnswer();
    }
  }

  void _backToPreviousQuestion() {
    final viewModel = context.read(challengeViewModel);
    if (viewModel.previousQuestion()) {
      Navigator.maybePop(context);
      Future.delayed(Duration(milliseconds: 20), () {
        _showQuestionDetail();
      });
    } else {
    }
  }

  void _sendAnswer() {
    final viewModel = context.read(challengeViewModel);
    viewModel.sendAnswer().then((value) {
      viewModel.reloadUserNewPoint();
      if (value != null) {
        showDialog(context: context, builder: (context) => DialogAnswerSuccess(value)).then((value) {
          Navigator.of(context, rootNavigator: true).pushNamedAndRemoveUntil(Constants.pageMaster, (route) => false);
        });
      }
    });
  }
}
