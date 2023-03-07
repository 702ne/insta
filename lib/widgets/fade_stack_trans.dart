import 'package:flutter/material.dart';
import 'package:insta/widgets/sign_in_form.dart';
import 'package:insta/widgets/sign_up_form.dart';

import '../const/screen_size.dart';

class FadeStackTrans extends StatefulWidget {
  final int selectedForm;

  const FadeStackTrans({super.key, required this.selectedForm});

  @override
  State<FadeStackTrans> createState() => _FadeStackTransState();
}

class _FadeStackTransState extends State<FadeStackTrans>
    with SingleTickerProviderStateMixin {
  List<Widget> forms = [const SignUpForm(), const SignInForm()];
  AnimationController? _animationController;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: trans_duration);
    _animationController!.forward();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant FadeStackTrans oldWidget) {
    if (widget.selectedForm != oldWidget.selectedForm) {
      _animationController!.forward(from: 0.0);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animationController!,
      // duration: trans_duration,
      child: IndexedStack(index: widget.selectedForm, children: forms),
    );
  }
}
