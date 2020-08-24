const Map localization = {
  'en': {
    'menu': {
      'play': 'Play',
      'settings': 'Settings',
    },
    'theme': {
      'theme0': 'Oriental Cherry',
      'theme1': 'Toffee',
      'theme2': 'Sand Blues',
    },
    'settings': {
      'autosave': 'Autosave',
      'on': 'On',
      'off': 'Off',
      'change': 'Change',
      'theme': 'Theme',
      'language': 'Language',
      'currentlang': 'English',
      'syncprog': 'Synchronise progress',
      'eraseprog': 'Erase progress',
      'erase': 'Erase',
      'confirmationtext': 'Do you want to erase progress?',
      'flushtext': 'Database deleted, progress erased!',
    },
    'selection': {
      'selection': 'Puzzle selection',
      'completed': 'Completed',
      'selectionconfirmation': 'Would you like to play level',
      'load': 'LOAD SAVE',
    },
    'game': {
      'save': 'SAVE',
      'character': 'Character',
      'pronunciation': 'Pronunciation',
      'meaning': 'Meaning',
      'examples': 'Examples',
      'defeattitle': 'DEFEAT',
      'defeatmessage': 'Would you like to try again?',
    },
    'collection': {
      'notilemessage': 'Once you finish a level, the cards you collected will appear here!'
    },
    'firebase' : {
      'synchro' : 'Synchronisation',
      'loggedas' : 'Logged user',
      'nousers' : 'Currently no logged users',
      'error' : 'Something went wrong, authorisation failed!',
      'signin' : 'Sign in with Google',
      'signout' : 'Sign out of Google',
    },
    'general': {
      'lives': 'Lives',
      'unlimited': 'Unlimited',
      'yes': 'Yes',
      'no': 'No',
      'settings': 'Settings',
      'collection': 'Collection',
      'tutorial': 'Tutorial',
      'tutorialmessage' : 'Swipe left and right to learn more about the game!',
      'nese' : 'nese',
      'error' : 'Something went wrong while loading the database!',
    },
    'picross': {
      0: {
        'Luck': 'Luck',
        'Well-being': 'Well-being',
        'Wish well': 'Wish well',
        'Material benefit': 'Material benefit',
      },
      1: {
        'Hajle Selassie': 'Hajle Selassie',
        'La': 'La',
        'Ma': 'Ma',
        'Wa': 'Wa',
      },
      2: {
        'Kind' : 'Kind',
        'Type' : 'Type',
        'Similar' : 'Similar',
        'Category' : 'Category',
      },
      3: {
        'New': 'New',
        'News': 'News',
        'Fresh': 'Fresh',
        'Innovation': 'Innovation',
      },
      4: {
        'Nothing': 'Nothing',
        'Nie': 'Nie',
        'Nein': 'Nein',
        'No': 'No',
      },
      5: {
        'Obtain': 'Obtain',
        'Receive': 'Receive',
        'Get': 'Get',
        'Violate law': 'Violate law',
      },
      6: {
        'Pleasure': 'Pleasure',
        'Happy': 'Happy',
        'Joy': 'Joy',
        'Optimistic': 'Optimistic',
      },
      7: {
        'Silver': 'Silver',
        'Bank': 'Bank',
        'Milky Way': 'Milky Way',
        'Screen': 'Screen',
      }
    },
    'tutorial': {
      0: {
        'title': 'Goal of the Game',
        'text': 'The goal of Picross (also known as Nonogram) is to uncover hidden pictures by marking tiles. Once all the correct tiles have been found, the game is completed. To mark a tile, simply tap it.'
      },
      1: {
        'title': 'Hints',
        'text': 'In order to know which tiles should be marked, you can refer to hint tiles located to the top and left of the game board. The numbers specify how many correct tiles in a row there are in a given vertical or horizontal line. For instance, a hint "2 2" indicates that this line contains two correct tiles next to each other, then at least one empty tile, and finally another pair of correct tiles next to each other. This sequence can be preceded and followed by unspecified number of empty tiles.'
      },
      2: {
        'title': 'Deduction is Key',
        'text': 'To solve a Picross puzzle, it is elementary to draw conclusions from limited info one possesses and focus on what is certain, filling the blanks step-by-step. For example, which tiles of a ten-tile long row you can be sure to mark as correct, knowing that nine out of ten tiles should be marked?'
      },
      3: {
        'title': 'Being Certain',
        'text': 'Regardless of where would the start of this sequence of nine tiles turn out to be, these eight tiles should be marked, because it is impossible for them not to be correct according to our information. The only mystery that remains is which of the remaining two tiles is to remain empty and which should be marked as well. To determine this part of the puzzle, you actually need greater context.'
      },
      4: {
        'title': "Tiles' Society",
        'text': "The relations between tiles are quite complex and it is not uncommon that marking a tile in one row will make the situation clearer for you in other parts of the board. Let's focus on the slice of the full game board you can see at the top. What do we know for certain?",
      },
      5: {
        'title': 'Crosses are Friends',
        'text': 'No matter how much we try to stretch the five-tile long sequence, it cannot reach the leftmost part of the row with the information we have. It is a good idea to cross these two tiles out. By doing so we not only make the deduction process easier for ourselves, as we know we can easily ignore these tiles, but the game will also prevent us from accidentally trying to mark them as correct. In that case they would get crossed out automatically, but for a price of a life point (and, unless you set lives to unlimited, the game will end if you run out of them). To cross a tile out, you can either double tap or press and hold it for a while. You can repeat this action to revert the tile back to its regular state.'
      },
      6: {
        'title': 'Rows and Columns',
        'text': 'The info you get from rows enriches your knowledge about columns and the other way around! When you are already certain about something, it becomes a foundation of your whole thinking process and helps you solve even the most convoluted parts of the puzzle, enabling you to complete the levels flawlessly.'
      },
      7: {
        'title': 'About Winning',
        'text': 'When you complete a level, you are awarded a character card that you can later find in your collection. Your general progress is stored automatically on your device, but you can also preserve it online so that it will always be safe (more info in "Synchronise progress" section in Settings). You can also save your progress of solving each level, either by using autosave (it is enabled by default) or saving manually by tapping "SAVE" button located next to the life bar.'
      },
    },
  },
  'pl': {
    'menu': {
      'play': 'Graj',
      'settings': 'Ustawienia',
    },
    'theme': {
      'theme0': 'Wiśnia Orientu',
      'theme1': 'Toffi',
      'theme2': 'Blues Piasków',
    },
    'settings' : {
      'autosave' : 'Autozapis',
      'on' : 'Wł.',
      'off' : 'Wył.',
      'change' : 'Zmień',
      'theme' : 'Motyw',
      'language' : 'Język',
      'currentlang' : 'polski',
      'syncprog' : 'Synchronizuj postępy',
      'eraseprog' : 'Wymaż postępy',
      'erase' : 'Wymaż',
      'confirmationtext' : 'Czy chcesz wymazać wszelkie postępy?',
      'flushtext' : 'Dane usunięte, postęp wymazany!',
    },
    'selection' : {
      'selection' : 'Wybór zagadki',
      'completed' : 'Ukończono',
      'selectionconfirmation' : 'Czy chcesz rozwiązać zagadkę o numerze',
      'load' : 'UŻYJ ZAPISU',
    },
    'game' : {
      'save' : 'ZAPISZ',
      'character' : 'Znak',
      'pronunciation' : 'Wymowa',
      'meaning' : 'Znaczenie',
      'examples' : 'Przykłady',
      'defeattitle' : 'KLĘSKA',
      'defeatmessage' : 'Czy chcesz spróbować ponownie?',
    },
    'collection' : {
      'notilemessage' : 'Zdobyte karty pojawią się w tym miejscu, gdy rozwiążesz zagadkę!'
    },
    'firebase' : {
      'synchro' : 'Synchronizacja',
      'loggedas' : 'Zalogowany użytkownik',
      'nousers' : 'Aktualnie brak zalogowanych użytkowników',
      'error' : 'Coś poszło nie tak, autoryzacja konta nie powiodła się!',
      'signin' : 'Zaloguj się do Google',
      'signout' : 'Wyloguj się z Google',
    },
    'general' : {
      'lives' : 'Życia',
      'unlimited' : 'Nieskończone',
      'yes' : 'Tak',
      'no' : 'Nie',
      'settings' : 'Ustawienia',
      'collection' : 'Kolekcja',
      'tutorial' : 'Tutorial',
      'tutorialmessage' : 'Przesuwaj ekran w lewo i prawo, by dowiedzieć się więcej!',
      'nese' : 'ński',
      'error' : 'Błąd podczas ładowania bazy danych!'
    },
    'picross' : {
      0 : {
        'Luck': 'Szczęście',
        'Well-being': 'Pomyślność',
        'Wish well': 'Dobrze życzyć',
        'Material benefit': 'Korzyść materialna',
      },
      1 : {
        'Hajle Selassie' : 'Kazimierz Wielki',
        'La' : 'Koko',
        'Ma' : 'Spoko',
        'Wa' : 'Maroko',
      },
      2 : {
        'Kind' : 'Rodzaj',
        'Type' : 'Typ',
        'Similar' : 'Podobny',
        'Category' : 'Kategoria',
      },
      3 : {
        'New' : 'Nowy',
        'News' : 'Wiadomości',
        'Fresh' : 'Świeży',
        'Innovation' : 'Innowacja',
      },
      4 : {
        'Nothing' : 'Nic',
        'Nie' : 'Nie',
        'Nein' : 'Nein',
        'No' : 'No',
      },
      5 : {
        'Obtain' : 'Zdobyć',
        'Receive' : 'Otrzymać',
        'Get' : 'Uzyskać',
        'Violate law' : 'Łamać prawo',
      },
      6 : {
        'Pleasure' : 'Przyjemność',
        'Happy' : 'Szczęśliwy',
        'Joy' : 'Radość',
        'Optimistic' : 'Optymistyczny',
      },
      7 : {
        'Silver' : 'Srebro',
        'Bank' : 'Bank',
        'Milky Way' : 'Droga Mleczna',
        'Screen' : 'Ekran',
      },
    },
    'tutorial': {
      0: {
        'title': 'Cel gry',
        'text': 'Celem gry typu Picross (znanej także jako Nonogram albo obrazek logiczny) jest nakreślenie obrazka poprzez zaznaczanie odpowiednich pól. Gra kończy się w chwili, gdy wszystkie poprawne pola zostały odnalezione. By zaznaczyć pole, wystarczy je nacisnąć.'
      },
      1: {
        'title': 'Podpowiedzi',
        'text': 'To, które pola należy zaznaczyć, wynika z podpowiedzi zlokalizowanych na górze i po lewej stronie planszy. Liczby oznaczają następującą po sobie liczbę prawidłowych pól w danej linii pionowej lub poziomej. Przykładowo, podpowiedź "2 2" oznacza, iż w danej linii tuż koło siebie znajdują się dwa prawidłowe pola, po nich występuje przynajmniej jedno puste pole, a następnie mamy kolejną parę prawidłowych pól. Sekwencja ta może być otoczona (z przodu i z tyłu) przez nieokreśloną liczbę pustych pól.'
      },
      2: {
        'title': 'Kluczem dedukcja',
        'text': 'By ukończyć poziom, konieczne jest wyciąganie wniosków z posiadanej wiedzy i skupienie na tym, co pewne, krok po kroku uzupełniając luki. Na przykład, które z dziesięciu pól tego rzędu możemy z pewnością zaznaczyć jako prawidłowe przy założeniu, że łącznie powinniśmy zaznaczyć ich dziewięć?'
      },
      3: {
        'title': 'Pewność',
        'text': 'Niezależnie od miejsca startu tej sekwencji, wskazanych osiem pól powinno być zaznaczonych, ponieważ nie ma takiego rozwiązania, w którym pozostałyby puste. Jedyna niewiadoma związana jest tutaj z tym, które z pozostałych pól należy zaznaczyć, a które pozostawić puste. Do rozwiązania problemu potrzeba jednak szerszej perspektywy.'
      },
      4: {
        'title': "Związki pól",
        'text': 'Relacje między polami są dość złożone i często zaznaczanie pola w jednym rzędzie znacząco rozjaśni sytuację w innych częściach planszy. Skupmy się na umieszczonym na górze wycinku. Czego możemy być pewni?',
      },
      5: {
        'title': 'Krzyżyki to przyjaciele',
        'text': 'Nawet próbując rozciągnąć sekwencję długą na pięc pól, niemożliwym jest, aby sięgnęła ona do lewej części rzędu zgodnie z posiadanymi informacjami. Dobrym pomysłem jest więc przekreślenie tych dwóch pól. Tym sposobem nie tylko ułatwiamy sobie proces dedukcji, mogąc swobodnie zignorować te pola, ale też pozwalamy grze uchronić nas przed przypadkowym ich kliknięciem. W takim przypadku zostałyby przekreślone automatycznie, ale za cenę punktów życia (których utrata, poza trybem nieskończonych żyć, oznacza przegraną). Naciśnij pole dwukrotnie lub przytrzymaj je przez chwilę, aby je przekreślić. Zrób to jeszcze raz, by przywrócić je do oryginalnego stanu.'
      },
      6: {
        'title': 'Rzędy i kolumny',
        'text': 'Informacje wynikające z rzędów wzbogacają wiedzę o kolumnach i odwrotnie! Gdy masz pewność co do czegoś, staje się to podstawą całego procesu eliminacji i pomaga rozwiązać nawet najbardziej zawiłe części zagadki.'
      },
      7: {
        'title': 'O wygrywaniu',
        'text': 'Gdy ukończysz poziom, otrzymasz kartę z danym znakiem, którą możesz później znaleźć w swojej kolekcji. Twoje ogólne postępy zapisywane są w pamięci urządzenia, możesz jednak skorzystać też z funkcji przechowywania online (więcej informacji w sekcji "Synchronizuj postęp" w ustawieniach). Możesz także zapisywać swoje postępy w obrębie danego poziomu poprzez skorzystanie z funkcji autozapisu (domyślnie włączona) lub ręcznie poprzez wciśnięcie przycisku "ZAPISZ" po prawej stronie paska życia.'
      },
    },
  },
};
