// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:api_base/gen/assets.gen.dart';
import 'package:api_base/injection/di.dart';
import 'package:api_base/presentation/presentation.dart';
import 'package:api_base/presentation/widgets/app_indicator/app_indicator.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class MediaDetailScreen extends StatefulWidget {
  const MediaDetailScreen({
    required this.mediaId,
    super.key,
  });

  final int mediaId;

  @override
  State<MediaDetailScreen> createState() => _MediaDetailScreenState();
}

class _MediaDetailScreenState extends State<MediaDetailScreen> {
  final MovieDetailCubit movieDetailCubit = getIt<MovieDetailCubit>();
  @override
  void initState() {
    super.initState();
    movieDetailCubit.fetchData(widget.mediaId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => movieDetailCubit,
      child: Scaffold(
        appBar: BaseAppBar.customTitleView(
          title: Text(
            'Movie Detail',
            style: AppTextStyles.headingSmall
                .copyWith(color: context.colors.textPrimary),
          ),
          isCenterTitle: false,
          widgets: [
            Assets.icons.icFavoriteOutline.svg(height: 24.h),
            16.horizontalSpace,
            Assets.icons.icStarOutline.svg(height: 24.h),
            16.horizontalSpace,
            Assets.icons.icBookmarkOutline.svg(height: 24.h),
            16.horizontalSpace,
          ],
        ),
        body: BlocBuilder<MovieDetailCubit, MovieDetailState>(
          bloc: movieDetailCubit,
          builder: (context, state) {
            return LoadingView(
              status: state.status,
              child: _MainContent(
                movieDetailCubit: movieDetailCubit,
              ),
            );
          },
        ),
      ),
    );
  }
}

class _MainContent extends StatelessWidget {
  const _MainContent({
    required this.movieDetailCubit,
  });

  final MovieDetailCubit movieDetailCubit;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        MediaInformationView(movieDetailCubit: movieDetailCubit),
        SliverToBoxAdapter(
          child: 24.verticalSpace,
        ),
        MediaCastCrewView(movieDetailCubit: movieDetailCubit),
        SliverToBoxAdapter(
          child: 24.verticalSpace,
        ),
        MediaTrailerVideoView(movieDetailCubit: movieDetailCubit),
        SliverToBoxAdapter(
          child: 24.verticalSpace,
        ),
        const MediaInformationOther(),
        SliverToBoxAdapter(
          child: 24.verticalSpace,
        ),
        MediaSimilarView(movieDetailCubit: movieDetailCubit),
        SliverToBoxAdapter(
          child: 24.verticalSpace,
        ),
      ],
    );
  }
}