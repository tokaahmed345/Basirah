// import 'package:findit/core/utils/router/routes_name.dart';
// import 'package:findit/core/utils/service_locator/service_locator.dart';
// import 'package:findit/core/utils/widgets/main_navigation_bar.dart';
// import 'package:findit/feature/ai_vision/presentation/cubit/ai_vision_cubit.dart';
// import 'package:findit/feature/auth/presentation/auth_view.dart';
// import 'package:findit/feature/auth/presentation/widgets/forgot_password.dart';
// import 'package:findit/feature/home/domain/entity/posts_entity.dart';
// import 'package:findit/feature/home/presentation/cubits/posts_cubit.dart';
// import 'package:findit/feature/home/presentation/cubits/verify_cubit/verify_claim_cubit.dart';
// import 'package:findit/feature/home/presentation/widgets/item_details/item_details_view.dart';
// import 'package:findit/feature/home/presentation/widgets/verify_claim.dart';
// import 'package:findit/feature/my_posts/presentation/cubit/review_cubit/claim_review_cubit.dart';
// import 'package:findit/feature/my_posts/presentation/widgets/review_claim_view.dart';
// import 'package:findit/feature/onboarding/presentation/onboarding_view.dart';
// import 'package:findit/feature/report_item/presentation/cubit/report_item_cubit.dart';
// import 'package:findit/feature/report_item/presentation/report_item.dart';
// import 'package:findit/feature/search/presentation/search_view.dart';
// import 'package:findit/feature/splash/presentation/splash_view.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:basirah/core/utils/router/routes_name.dart';
import 'package:basirah/feature/home/presentation/home_view.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: RoutesName.home,

    routes: [
     
      GoRoute(
        path: RoutesName.home,
        name: RoutesName.home,
        builder: (context, state) => const HomeView(),
      ),

      
    ],

  );
}
