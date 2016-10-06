# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

password = 'password'

User.create_with_password('spectre@sbcglobal.net', password)
User.create_with_password('bobcat@bobcat.org', password)
User.create_with_password('rudy@gmail.com', password)
User.create_with_password('bozo@soundclown.com', password)

Band.create!(name: "Buckethead")
Band.create!(name: 'Rammstein')
Band.create!(name: 'Frank Zappa')

Album.create!(title: 'Population Override', band_id: 1, recorded: 'STUDIO')
Album.create!(title: 'Live Aus Berlin', band_id: 2, recorded: 'LIVE')
Album.create!(title: 'Liebe ist fur Alle Da', band_id: 2, recorded: 'STUDIO')
Album.create!(title: 'Hot Rats', band_id: 3, recorded: 'STUDIO')

%w{Unrestrained\ Growth Too\ Many\ Humans Population\ Override
Cruel\ Reality\ of\ Nature A\ Day\ Will\ Come Earth\ Heals\ Herself
Clones Super\ Human ...
}.each.with_index do |song, pos|

  Track.create!(song: song, ord: pos, album_id: 1, version: 'STANDARD')
end

%w{Spiel\ Mit\ Mir Bestraffe\ Mich Weisses\ Fleisch Sehnsucht Asche\ Zu\
Asche Wilder\ Wein Heirate\ Mich Du\ Riechst\ So\ Gut Du\ Hast Buck\
Dich Engel Rammstein Laichzeit Wollt\ Ihr\ Das\ Bett\ in\ Flammen\
Sehen Seemann
}.each.with_index do |song, pos|

  Track.create!(song: song, ord: pos, album_id: 2, version: 'BONUS')
end

%w{Fuhre\ Mich Rammlied Donaukinder Ich\ tu\ dir\ weh Halt Waidmmanns\
Heil Haifisch Roter\ Sand B******** Liese Fruhling\ in\ Paris Wiener\
Blut Pussy\ Liebe\ ist\ fur\ alle\ da Mehr
}.each.with_index do |song, pos|

  Track.create!(song: song, ord: pos, album_id: 3, version: 'STANDARD')
end

%w{
  Peches\ en\ Regalia Willie\ the\ Pimp Son\ of\ Mr.\ Green\ Genes
  Littlle\ Umbrellas The\ Gumbo\ Variations It\ Must\ Be\ a\ Camel
}.each.with_index do |song, pos|

  Track.create!(song: song, ord: pos, album_id: 4, version: 'STANDARD')
end
