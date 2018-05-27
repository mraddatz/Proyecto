# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create(:email=>'admin@uc.cl', :password=>'000000', :admin=>true)
User.create(:email=>'martin@uc.cl', :password=>'000000', :admin=>false)
Forum.create(:name=>'Futbol', :description=>'Topicos sobre Futbol')
Forum.create(:name=>'UC', :description=>'Menciona temas de la UC')
Post.create(:name=>'Chile en el mundial', :text=>"Porque no va?", :forum_id=>1, :user_id=>1)
