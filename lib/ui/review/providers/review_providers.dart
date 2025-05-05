// import 'package:apprendre_lsf/data/repositories/decks/deck_repository_provider.dart';
// import 'package:apprendre_lsf/domain/mappers/retention_card_fsrs_card.dart';
// import 'package:apprendre_lsf/domain/models/card_model/full_card.dart';
// import 'package:apprendre_lsf/domain/models/retention_card/retention_card.dart';
// import 'package:apprendre_lsf/global_providers.dart';
// import 'package:collection/collection.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:fsrs/fsrs.dart' as fsrs;

// enum RevisionMode { blanc, fsrs }

// final selectedRevisionModeProvider = StateProvider((_) => RevisionMode.blanc);

// // final revisionNotifierProvider = NotifierProvider((_) {
// // 	final revisionMode = ref.watch(selectedRevisionModeProvider);
	
// // 	if (revisionMode.blanc) {
// // 		return BlancRevisionNotifier();
// // 	} else {
// // 		return FSRSRevisionNotifier();
// // 	}
// // });

// class RevisionState {
// 	RevisionState({ required this.cardsLeft, this.cardToRevise,});

// 	int cardsLeft;	
// 	FullCard? cardToRevise;
// }

// class RevisionStateInitial extends RevisionState {
// 	RevisionStateInitial() : super(cardsLeft: 0, cardToRevise: null);
// }

// class RevisionStateError extends RevisionState {
// 	RevisionStateError() : super(cardsLeft: 0, cardToRevise: null);
// }

// abstract class RevisionNotifier extends Notifier<RevisionState> {
// 	@override
// 	RevisionState build() => RevisionStateInitial();
	
// 	void init(List<FullCard>? cards);
// 	void submitAnswer(RetentionRating rating);
// }

// class BlancRevisionNotifier extends Notifier<RevisionState> { 
// 	final removeAfterXEasy = 2;
// 	List<FullCard> _cardsToRevise = [];
// 	List<FullCard> _cardInSuccess = [];

//   @override
//   RevisionState build() => 
//     RevisionStateInitial();

// 	@override
// 	void init(List<FullCard>? cards) {
// 		if (cards == null) {
// 			state = RevisionStateError();
//       return;
// 		}
		
// 	  cards.sortBy((card) => card.card.createdAt!);
// 		state = RevisionState(
// 			cardToRevise: cards.firstOrNull,
// 			cardsLeft: cards.length,
// 		);
// 	}
	
// 	@override
// 	void submitAnswer(RetentionRating rating) {
// 		final actualCard = state.cardToRevise!;
// 		final timesCardSucces = _cardInSuccess.where((card) => actualCard!.card.id == card.card.id).length;
		
//     switch (rating) {
//       case (RetentionRating.easy):
//         if (timesCardSucces + 1 < removeAfterXEasy) {
//                 reinsertCardAtPercent(actualCard, 0.8);
//               }
//         _cardInSuccess.add(actualCard);
//         break;
//       case (RetentionRating.good):
//                 reinsertCardAtPercent(actualCard, 0.5);
//                 break;
//       case (RetentionRating.hard):
//                 reinsertCardAfterXCards(actualCard, 3);
//                 break;
//       case (RetentionRating.again):
//                 reinsertCardAfterXCards(actualCard, 1);
         
//     }

		
// 		_cardsToRevise.removeAt(0);
		
// 		state = RevisionState(
// 			cardToRevise: _cardsToRevise.firstOrNull,
// 			cardsLeft: _cardsToRevise.length
// 		);
// 	}
	
// 	//0 => [actual, ici]
// 	//1 => [actual, next, ici]
// 	void reinsertCardAfterXCards(FullCard card, int inXCard) {
// 		try {
// 			_cardsToRevise.insert(inXCard + 1, card);
// 		} catch (_) {
// 			_cardsToRevise.add(card);
// 		}
// 	}
	
// 	//ECRIRE TEST
// 	//[3] 50% => index 1 [x, ici, x, x] 
// 	void reinsertCardAtPercent(FullCard card, double percent) {
// 		final index = (_cardsToRevise.length * percent).truncate();
// 		reinsertCardAfterXCards(card, index);
// 	}
// }



// class FSRSRevisionNotifier extends Notifier<RevisionState> { 
//   @override
//   RevisionState build() => 
//     RevisionStateInitial();

// 	@override
// 	void init(List<FullCard>? cards) {
// 		final cardLefts = getNewCards();
// 		state = RevisionState(
// 			cardToRevise: cardLefts.firstOrNull,
// 			cardsLeft: cardLefts.length
// 		);
// 	}
	
// 	@override
// 	void submitAnswer(RetentionRating rating) async {
//     final deckRepository = ref.watch(decksRepositoryProvider);
// 		final FullCard card = state.cardToRevise!;
// 		final fsrsInst = fsrs.FSRS();
// 		final now = DateTime.now();
// 		final schedulingCards = fsrsInst.repeat(card.deckInfos!.retentionCard.toFsrsCard(), now);
		
//     final updatedCard = schedulingCards[rating.toFsrsRating()]!.card;
// 		await deckRepository.setCardRetention(cardId: card.card.id!, retention: updatedCard.toFsrsCard());
// 		final cardLefts = getNewCards();

// 		state = RevisionState(
// 			cardToRevise: cardLefts.firstOrNull,
// 			cardsLeft: cardLefts.length
// 		);
// 	}
	
// 	List<FullCard> getNewCards() async {
//   final allCards = await ref.read(decksRepositoryProvider).getAllCards();
//   allCards.sortBy((card) => card.deckInfos.retentionCard.due)
// 		.where(dueTo < now())
// 		.orderBy(dueTo);

//   }}

// UI :
// @override
// Widget build() {
// 	final revSate = ref.watch<RevisionProvider>;
// 	final showSignFirst = ref.watch<bool>(showSignFirstProvider);

// 	//ne sera logiquement plus RevisionStateInitial après le 1er submitAnswer
// 	if (revSate is not RevisionError) {
// 		return RevisionError();	
// 	}
// 	if (revSate is not RevisionStateInitial && revState.cardToRevise == null) {
// 		return RevisionEnd();
// 	}
// 	return Column(
// 			children: [
// 				ToogleQuestionMode(showSignFirst),
// 				Question(revSate.cardToRevise),
// 			]
// 		)
// 		onTap() => ref.read<RevisionProvider>.submitAnswer(user_answer);
// 	}
// }

