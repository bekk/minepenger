# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

# Hovedkategorier
Category.create(
  [
    { :name => 'Kjøretøy' },
    { :name => 'Utgifter og regninger' },
    { :name => 'Utdanning' },
    { :name => 'Underholdning' },
    { :name => 'Finans og investeringer' },
    { :name => 'Mat og dagligvarer' },
    { :name => 'Helse' },
    { :name => 'Hjem' },
    { :name => 'Barn' },
    { :name => 'Annet' },
    { :name => 'Personlig' },
    { :name => 'Husdyr' },
    { :name => 'Shopping' },
    { :name => 'Reise og ferie' }
  ]
)

# Underkategorier
kjoretoy = Category.where( :name => 'Kjøretøy').first
regninger = Category.where( :name => 'Utgifter og regninger').first
mat = Category.where( :name => 'Mat og dagligvarer').first

Category.create(
  [
    # Kjøretøy
    { :name => 'Drivstoff', :category => kjoretoy },

    # Utgifter og regninger
    { :name => 'Internett', :category => regninger },
    { :name => 'Telefon', :category => regninger },
    { :name => 'Strøm', :category => regninger },
    { :name => 'Mobil', :category => regninger },
    { :name => 'Internett', :category => regninger },
    { :name => 'Kabel TV', :category => regninger },

    # Mat og dagligvarer
    { :name => 'Fastfood', :category => mat },
    { :name => 'Restauranter', :category => mat },
    { :name => 'Dagligvarer', :category => mat },
    { :name => 'Kafeer', :category => mat },
  ]
)

dagligvarer = Category.where( :name => 'Dagligvarer').first

# Kjente butikker og koblinger til kategorier
Merchant.create(
  [
    # DAGLIGVAREKJEDER
    { :name=> 'Rema 1000', :category => dagligvarer },
    { :name=> 'Rimi', :category => dagligvarer },
    { :name=> 'Ica', :category => dagligvarer },
    { :name=> 'Coop', :category => dagligvarer },
    { :name=> 'Prix', :category => dagligvarer },
    { :name=> 'Mega', :category => dagligvarer },
    { :name=> 'Meny', :category => dagligvarer },
    { :name=> 'Ultra', :category => dagligvarer },
    { :name=> 'Kiwi', :category => dagligvarer }
  ]
)