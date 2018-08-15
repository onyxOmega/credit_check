class CreditCheck
  attr_reader :credit_limit, :valid

  def initialize(card_number, credit_limit)
    @card_number = card_number
    @credit_limit = credit_limit
    @valid = false
    @digit_array = []
    self.is_valid?
  end

  def is_valid?
    get_digits
    # binding.pry
    doubled = double_every_other
    summed_over_ten = sum_over_ten(doubled)
    sum = sum_digits(summed_over_ten)
    @valid = divisible_by_ten?(sum)
  end

  def get_digits
    characters = @card_number.chars
    characters.each do |character|
      @digit_array << character.to_i
    end
    @digit_array
  end

  def double_every_other
    doubled = []
    @digit_array.each.with_index do |digit, index|
      if index.even?
        doubled << digit * 2
      else
        doubled << digit
      end
    end
    doubled
  end

  def sum_over_ten(digits)
    summed_over_ten = []
    digits.each do |digit|
      if digit > 9
        summed_over_ten << digit - 9
      else
        summed_over_ten << digit
      end
    end
    summed_over_ten
  end

  def sum_digits(digits)
    sum = 0
    digits.each do |digit|
      sum += digit
    end
    sum
  end

  def divisible_by_ten?(sum)
    if sum % 10 == 0
      true
    else
      false
    end
  end

  def last_four
    @digit_array[-4..-1].join
  end

  def masked_number
    return '*' * (@card_number.length - 4) + last_four
  end

  def output
    if @valid
      "The number #{masked_number} is valid"
    else
      "The number #{masked_number} is invalid"
    end
  end
end
