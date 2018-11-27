// App initializer
void main() {
  Deck deck = new Deck();

  print('=========================');
  print('== Fresh Deck of Cards ==');
  print('=========================');
  print('New number of cards in deck: ${deck.cards.length}');
  print(' ');
  print(deck);
  print(' ');

  deck.shuffle();
  print('=========================');
  print('===== Shuffled Deck =====');
  print('=========================');
  print('New number of cards in deck: ${deck.cards.length}');
  print(' ');
  print(deck);
  print(' ');

  deck.discardSpecific(rank: 1, suit: 'Spades');
  print('=========================');
  print('= Discard Ace of Spades =');
  print('=========================');
  print('New number of cards in deck: ${deck.cards.length}');
  print(' ');
  print(deck);
  print(' ');

  List<Card> hand = deck.deal(numCards: 5);
  print('=========================');
  print('======= Your hand =======');
  print('=========================');
  print('New number of cards in deck: ${deck.cards.length}');
  print(' ');
  print(hand);
  print(' ');
}

// ============
// Classes
// ============

// Cards
class Card {
  String suit;
  int rank;
  String name;

  // Constructor
  Card({String this.suit, int this.rank}) {
    name = getNameFromRank(rank: rank);
  }

  // Overrides
  @override
  toString() {
    return '$name of $suit';
  }

  // convert number "rank" to a human readable "name"
  getNameFromRank({int rank}) {
    switch (rank) {
      case 1:
        return 'Ace';
      case 11:
        return 'Jack';
      case 12:
        return 'Queen';
      case 13:
        return 'King';
      default:
        return '$rank';
    }
  }
}

// Deck of cards
class Deck {
  List<Card> cards = [];

  // ===========
  // Constructor
  // ===========
  Deck() {
    List<String> suits = ['Diamonds', 'Hearts', 'Clubs', 'Spades'];
    List<int> ranks = new List<int>.generate(13, (int idx) => idx + 1);

    for (var suit in suits) {
      for (var rank in ranks) {
        Card card = new Card(suit: suit, rank: rank);
        cards.add(card);
      }
    }
  }

  // Overrides =====

  // toString()
  @override
  toString() {
    return cards.toString();
  }

  // Methods =====

  // shuffle
  shuffle() {
    cards.shuffle();
  }

  // get cards with suit
  cardsWithSuit({String suit}) {
    return cards.where((card) => card.suit == suit);
  }

  // deal
  deal({int numCards}) {
    List<Card> hand = cards.sublist(0, numCards);
    cards = cards.sublist(numCards);

    return hand;
  }

  // discard
  discardFromTop({int numCards}) {
    cards = cards.sublist(numCards);
  }

  // discard specific card
  discardSpecific({int rank, String suit}) {
    cards.removeWhere((card) => (card.rank == rank && card.suit == suit));
  }
}
