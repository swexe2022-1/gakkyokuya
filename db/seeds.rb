yamada = User.create!(name: '山田太郎', 
                      email: 'yamada@example.com', 
                      password_digest:  BCrypt::Password.create('yamada'))
tanaka = User.create!(name: '田中次郎', 
                      email: 'tanaka@example.com', 
                      password_digest:  BCrypt::Password.create('tanaka'))

User.all.each do |user|
  name = user.email.split("@")[0]
  1.upto(5) do |i|
    title = "楽曲_#{name}_#{i}"
    Track.create!(user: user, 
                  title: title, 
                  mp3: File.open("./db/seed_data/music/#{name}.mp3"), 
                  description: "楽曲の説明楽曲の説明楽曲の説明楽曲の説明楽曲の説明楽曲の説明楽曲の説明楽曲の説明楽曲の説明楽曲の説明", 
                  thumbnail: File.open("./db/seed_data/image/#{title}.jpg").read)
  end
  
  1.upto(2) do |i|
    title = "プレイリスト_#{name}_#{i}"
    playlist = Playlist.create!(user: user, 
                                title: title,
                                thumbnail: File.open("./db/seed_data/image/#{title}.jpg").read)
  end
end

1.upto(3) do |m|
  Playlist.first.tracks << Track.find(m)
end
