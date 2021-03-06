# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or create!d alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create!([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create!(:name => 'Daley', :city => cities.first)

# normikset
User.create!(:name => "sampe", :pass => "muna")
User.create!(:name => "katti", :pass => "gissa")

# assarit
User.create!(:name => "Auringonkukka", :pass => "ak")
User.create!(:name => "Muna Pää", :pass => "")
User.create!(:name => "Kookos Pää", :pass => "")

Course.create!(:name => "Ruby", :desc => "Muna-Paksulan junakurssi")
Course.create!(:name => "ERB", :desc => "Inhottava timanttikurssi")

Party.create!(:time => "Syksy 2009", :course_id => 1)
Party.create!(:time => "Kevät 2009", :course_id => 2)

Group.create!(:time => "ti 12-14", :ass => User.find_by_name("Muna Pää"), :party_id => 1)

Party.all.second.groups.create!(:time => "ti 12-14", :where => "B221", :ass_id => 4)
Party.all.second.groups.create!(:time => "ke 12-14", :where => "B221", :ass_id => 5)

Course.find_by_name("Ruby").parties.create!(:time => "Kesä 2010", :desc => "Villi kesäversio ruubista").
  groups.create!(:time => "to 10-12", :ass => User.find_by_pass("ak"))

# sampe registers to all parties' first group!
User.first.groups << Party.all.collect { |party| party.groups.first }

