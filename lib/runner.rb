require './credit_check.rb'
require 'pry'

card_number = "5541801923795240"
credit_limit = 2000
card_1 = CreditCheck.new(card_number, credit_limit)
puts card_1.output


card_number = "4552250155205839"
credit_limit = 2000
card_2 = CreditCheck.new(card_number, credit_limit)
valid = card_2.valid
puts card_2.output
