import 'package:api_base/gen/assets.gen.dart';
import 'package:api_base/presentation/presentation.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar.titleAndBackButton(
        title: '',
        shouldShowBottomDivider: false,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 16.w),
          child: Column(
            children: [
              _buildLogo(context),
              16.verticalSpace,
              _buildTitle(context),
              32.verticalSpace,
              _buildLoginButton(
                context,
                icon: Assets.icons.icFacebook,
                title: 'Continue with Facebook',
                onTap: () {
                  //
                },
              ),
              16.verticalSpace,
              _buildLoginButton(
                context,
                icon: Assets.icons.icGoogle,
                title: 'Continue with Google',
                onTap: () {
                  //
                },
              ),
              16.verticalSpace,
              _buildLoginButton(
                context,
                icon: Assets.icons.icApple,
                title: 'Continue with Apple',
                onTap: () {
                  //
                },
              ),
              32.verticalSpace,
              _buildOrDivider(context),
              32.verticalSpace,
              AppButton(
                isExpanded: true,
                title: 'Sign in with password',
                onTap: () {},
              ),
              const Spacer(),
              _buildSignUp(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSignUp(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account?",
          style: AppTextStyles.labelMediumLight
              .copyWith(color: context.colors.textSecondary),
        ),
        4.horizontalSpace,
        AppTextButton(
          onTap: () {
            //
          },
          title: 'Sign up',
        ),
      ],
    );
  }

  Widget _buildOrDivider(BuildContext context) {
    return AppVerticalDivider(
      child: Text(
        'or',
        style: AppTextStyles.textMedium.copyWith(
          color: context.colors.textSecondary,
        ),
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Text(
      "Let's you In",
      style: AppTextStyles.headingLarge.copyWith(
        color: context.colors.textPrimary,
      ),
    );
  }

  Widget _buildLogo(BuildContext context) {
    return Container(
      height: 200.h,
      width: 200.w,
      color: context.colors.backdropPrimary,
    );
  }

  Widget _buildLoginButton(
    BuildContext context, {
    required SvgGenImage icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: context.colors.border,
          ),
          borderRadius: BorderRadius.circular(15.r),
        ),
        padding: EdgeInsets.symmetric(vertical: 12.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon.svg(height: 30.h),
            8.horizontalSpace,
            Text(
              title,
              style: AppTextStyles.textLargeBold.copyWith(
                color: context.colors.textPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}