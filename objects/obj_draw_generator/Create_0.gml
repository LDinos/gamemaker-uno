//this object handles spawning the drawn card visuals

deal_time = 60 //number of frames that it will take to spawn the cards
timer = 0 //how far we are through the deal time
cards_dealt = 0 //how many cards have been generated

//below variables are initialised in start_card_draw()
//initial_cards: how many cards total to generate
//target: player to send the cards towards