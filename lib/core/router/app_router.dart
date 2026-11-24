import 'package:go_router/go_router.dart';
import '../../features/auth_profile/presentation/pages/splash_page.dart';
import '../../features/auth_profile/presentation/pages/onboarding_page.dart';
import '../../features/auth_profile/presentation/pages/login_page.dart';
import '../../features/auth_profile/presentation/pages/role_select_page.dart';
import '../../features/dashboard/presentation/pages/home_page.dart';
import '../../features/dashboard/presentation/pages/home_ar_page.dart';
import '../../features/campaign/presentation/pages/campaign_form_page.dart';
import '../../features/campaign/presentation/pages/plan_generating_page.dart';
import '../../features/campaign/presentation/pages/plan_review_page.dart';
import '../../features/discovery_matching/presentation/pages/discover_page.dart';
import '../../features/discovery_matching/presentation/pages/provider_profile_page.dart';
import '../../features/proposals_workspace/presentation/pages/proposals_page.dart';
import '../../features/proposals_workspace/presentation/pages/workspace_chat_page.dart';
import '../../features/deliverables/presentation/pages/deliverables_page.dart';
import '../../features/reviews_reports/presentation/pages/review_page.dart';
import '../../features/notifications/presentation/pages/notifications_page.dart';
import '../../features/admin/presentation/pages/admin_page.dart';

GoRouter buildRouter() {
  return GoRouter(
    initialLocation: '/splash',
    routes: [
      GoRoute(path: '/splash', builder: (_, __) => const SplashPage()),
      GoRoute(path: '/onboarding', builder: (_, __) => const OnboardingPage()),
      GoRoute(path: '/login', builder: (_, __) => const LoginPage()),
      GoRoute(path: '/register', builder: (_, __) => const RoleSelectPage()),
      GoRoute(path: '/home', builder: (_, __) => const HomePage()),
      GoRoute(path: '/home-ar', builder: (_, __) => const HomeArPage()),
      GoRoute(path: '/campaign/new', builder: (_, __) => const CampaignFormPage()),
      GoRoute(path: '/campaign/plan/generating', builder: (_, __) => const PlanGeneratingPage()),
      GoRoute(path: '/campaign/plan', builder: (_, __) => const PlanReviewPage()),
      GoRoute(path: '/discover', builder: (_, __) => const DiscoverPage()),
      GoRoute(path: '/provider', builder: (_, __) => const ProviderProfilePage()),
      GoRoute(path: '/proposals', builder: (_, __) => const ProposalsPage()),
      GoRoute(path: '/workspace', builder: (_, __) => const WorkspaceChatPage()),
      GoRoute(path: '/workspace/deliverables', builder: (_, __) => const DeliverablesPage()),
      GoRoute(path: '/review', builder: (_, __) => const ReviewPage()),
      GoRoute(path: '/notifications', builder: (_, __) => const NotificationsPage()),
      GoRoute(path: '/admin', builder: (_, __) => const AdminPage()),
    ],
  );
}
