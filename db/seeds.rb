# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Adminkey.create!(:rolename =>'管理者')
Adminkey.create!(:rolename =>'學生')
Adminkey.create!(:rolename =>'老師')
User.create!(:email => "jellybox@gmail.com",:name => "Jimmy Liu",:accountname => "jellybox" ,:password => "default",:password_confirmation => "default",:adminkey_id => 1)
User.create!(:email => "test@aaa.com",:name => "Test Student",:accountname => "teststudent" ,:password => "default",:password_confirmation => "default")
Posttype.create!(:typename =>'news')
Posttype.create!(:typename =>'archived')
Post.create!(:topic => '歡迎！',:content => 'Hello World！',:user_id => 1,:posttype_id => 1)