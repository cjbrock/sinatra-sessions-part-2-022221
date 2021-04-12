# *** DEPENDENT ***
User.destroy_all
Thought.destroy_all


options = [false,true]


5.times do

    User.create(name: Faker::JapaneseMedia::Naruto.character, 
    username:Faker::JapaneseMedia::DragonBall.planet,
    password: "password")

end


25.times do

    Thought.create(
        subject: Faker::Book.unique.title,
        details: [Faker::Quote.famous_last_words, Faker::Quote.most_interesting_man_in_the_world, Faker::Quote.robin].sample,
        sentiment: ["positive", "negative", "neutral"].sample,
        
        intrusive: options.sample,
        logical: options.sample,
        user: User.all.sample
    )

end




puts "
🙌🙌🙌🙌🙌🙌🙌🙌
✅ ALL DZUUUN!!!!
🙌🙌🙌🙌🙌🙌🙌🙌

"