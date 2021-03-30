# BlackJack

https://en.wikipedia.org/wiki/Blackjack

## Need to implement BlackJack Console game using ruby.

### Plan:
1. On game start we should ask user to provide his name and store it
1. При запуске игры мы должны попросить пользователя указать свое имя и сохранить его.

2. Then ask to press any key to start the game
2. Затем попросите нажать любую клавишу, чтобы запустить игру.

3. User and computer get 2 cards each
3. Пользователь и компьютер получают по 2 карты.

4. System asks user if he wants to take one more card (cycle)
4. Система спрашивает пользователя, хочет ли он взять еще одну карту (цикл)

5. WHen user stop taking new cards and his score <= 21, computer logic takes cards one by one (max is determined by CONSTANT)
5. Когда пользователь перестает брать новые карты и его оценка <= 21, компьютерная логика берет карты одну за другой
(максимальное значение определяется КОНСТАНТОЙ).

6. Showing results and asking user about new game.
6. Отображение результатов и вопрос пользователя о новой игре.

puts "\u2664" пика
puts "\u2661" червы
puts "\u2667" крести
puts "\u2662" бубны