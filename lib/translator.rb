
class Translator
  
  def initialize
    @row = nil
    @col = nil
  end

  def translate(letter_num)

    coords = letter_num.split('')
    translate_number(coords[1])
    translate_letter(coords[0])
    { row: @row, col: @col }
  end

  private

  def translate_letter(letter)
    letter.downcase.ord - 97
  end

  def translate_number(number)
    @row = 8 - number.to_i
  end
end