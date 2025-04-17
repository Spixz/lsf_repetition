import 'package:apprendre_lsf/ui/dictionaries/search/dictionaries_search_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:apprendre_lsf/domain/models/card_model/card_model.dart';
import 'package:apprendre_lsf/routing/routes_name.dart';
import 'package:apprendre_lsf/ui/cards/create/create_card_screen.dart';
import 'package:apprendre_lsf/ui/cards/create/create_card_viewmodel.dart';
import 'package:apprendre_lsf/ui/home/home_screen.dart';
import 'package:provider/provider.dart';

/// https://www.reddit.com/r/FlutterDev/comments/1in53yf/comment/mc84gse/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button
GoRouter createRouter() => GoRouter(
  initialLocation: Routes.searchDictionariesResults.path,
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: Routes.home.path,
      name: Routes.home.name,
      builder: (context, state) {
        return const HomeScreen();
      },
    ),
    GoRoute(
      path: Routes.createCard.path,
      name: Routes.createCard.name,
      builder: (context, state) {
        CardModel card = state.extra as CardModel;
        final viewModel = CreateCardViewmodel(
          cardToCreate: card,
          deckRepository: context.read(),
        );
        return CreateCardScreen(viewModel: viewModel);
      },
    ),
    GoRoute(
      path: Routes.searchDictionariesResults.path,
      name: Routes.searchDictionariesResults.name,
      builder: (context, state) {
        // final LsfDictionaryMeaning meaning = LsfDictionaryMeaning(
        //   definition:
        //       "formule de politesse par laquelle on prend congé de qqn.",
        //   wordSigns: [
        //     LsfDictionaryMedia(
        //       videoUrl:
        //           "https://elix-lsf.s3.rbx.io.cloud.ovh.net/spip_videos/prendre_v_8_6.mp4",
        //       imageUrl:
        //           "https://elix-lsf.s3.rbx.io.cloud.ovh.net/spip_images/eca3753cfe83e125030525cf4df2f36e.jpg",
        //       author: null,
        //     ),
        //     LsfDictionaryMedia(
        //       videoUrl:
        //           "https://elix-lsf.s3.rbx.io.cloud.ovh.net/spip_videos/10_dire_1__nm_2td001.mp4",
        //       imageUrl:
        //           "https://elix-lsf.s3.rbx.io.cloud.ovh.net/spip_images/eca3753cfe83e125030525cf4df2f36e.jpg",
        //       author: null,
        //     ),
        //     LsfDictionaryMedia(
        //       videoUrl:
        //           "https://elix-lsf.s3.rbx.io.cloud.ovh.net/spip_videos/prendre_v_8_6.mp4",
        //       imageUrl:
        //           "https://elix-lsf.s3.rbx.io.cloud.ovh.net/spip_images/eca3753cfe83e125030525cf4df2f36e.jpg",
        //       author: null,
        //     ),
        //     LsfDictionaryMedia(
        //       videoUrl:
        //           "https://elix-lsf.s3.rbx.io.cloud.ovh.net/spip_videos/salut_int_1_1.mp4",
        //       imageUrl:
        //           "https://elix-lsf.s3.rbx.io.cloud.ovh.net/spip_images/eca3753cfe83e125030525cf4df2f36e.jpg",
        //       author: null,
        //     ),
        //     LsfDictionaryMedia(
        //       videoUrl:
        //           "https://elix-lsf.s3.rbx.io.cloud.ovh.net/spip_videos/10_dire_1__nm_2td001.mp4",
        //       imageUrl:
        //           "https://elix-lsf.s3.rbx.io.cloud.ovh.net/spip_images/eca3753cfe83e125030525cf4df2f36e.jpg",
        //       author: null,
        //     ),
        //   ],
        //   definitionSigns: [
        //     LsfDictionaryMedia(
        //       videoUrl:
        //           "https://elix-lsf.s3.rbx.io.cloud.ovh.net/spip_videos/salut_int_1.mp4",
        //       imageUrl:
        //           "https://elix-lsf.s3.rbx.io.cloud.ovh.net/spip_images/bb26943ab9cead68288346566745e97c.jpg",
        //       author: null,
        //     ),
        //   ],
        // );
        //! L> etait la avant      

        // return MeaningVideosSignsScreen(
        //   viewModel: MeaningVideosSignsViewmodel(meaning: meaning),
        // );

        // final viewModel2 =
        //     CreateCardViewmodel(deckRepository: context.read());
        // return CreateCard(
        //   viewModel: viewModel2,
        // );

        print('router create search result');
        return DictionariesSearchScreen();
      },
    ),
  ],
);
