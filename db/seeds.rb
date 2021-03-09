User.destroy_all 
Quote.destroy_all
UserFortune.destroy_all

# User.reset_pk_sequence
# Quote.reset_pk_sequence
# UserFortune.reset_pk_sequence


jabair = User.create(username: "jabair", password: "abc123")
shafee = User.create(username: "shafee", password: "abc123")
andre = User.create(username: "andre", password: "andre3000")
stuart = User.create(username: "stuart", password: "abc123")
michael = User.create(username: "mj", password: "goat23")

fortune1 = Quote.create(affirmation: "You're the master of your domain.")
fortune2 = Quote.create(affirmation: "They're no tests, just code challenges.")
fortune3 = Quote.create(affirmation: "Real G's move in silence, like lasagna.")
fortune4 = Quote.create(affirmation: "Beyonce had the greatest music video of all time.")
fortune5 = Quote.create(affirmation: "Be like water.")

uf1 = UserFortune.create(user_id: jabair.id, quote_id: fortune1.id)
uf2 = UserFortune.create(user_id: shafee.id, quote_id: fortune2.id)
uf3 = UserFortune.create(user_id: andre.id, quote_id: fortune3.id)
uf4 = UserFortune.create(user_id: stuart.id, quote_id: fortune4.id)
uf5 = UserFortune.create(user_id: michael.id, quote_id: fortune5.id)



binding.pry 
##something here