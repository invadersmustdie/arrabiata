class Arrabiata
  class ArrabiataError < StandardError; end
  class NoZeroInRomanNumbers < ArrabiataError; end
  class UnknownRomanNumberError < ArrabiataError; end

  CONVERSION = {
    "M"     => 1000,
    "CM"    => 900,
    "D"     => 500,
    "CD"    => 400,
    "C"     => 100,
    "XC"    => 90,
    "L"     => 50,
    "XL"    => 40,
    "X"     => 10,
    "IX"    => 9,
    "V"     => 5,
    "IV"    => 4,
    "I"     => 1
  }

  # Converts arabic number to roman letters.
  #
  # @param [Fixnum] arabic number
  # @return [String] roman letters
  #
  def self.to_roman(n)
    raise ArgumentError, "first argument is not a Fixnum" if !n.is_a?(Fixnum)
    raise NoZeroInRomanNumbers, "roman numeral system doesn't include 0" if n == 0

    result = ""

    CONVERSION.sort_by { |d| d.last }.reverse.each do |roman, arabic|
      while(n >= arabic) do
        result << roman
        n -= arabic
      end
    end

    result
  end

  # Converts roman letters to arabic number.
  #
  # @param [String] roman letters
  # @return [Fixnum] arabic number
  #
  def self.to_arabic(str)
    raise ArgumentError, "first argument is not a String" if !str.is_a?(String)

    result = 0

    chars = str.scan(/\w/)
    sum_up = 0
    sub_down = 0

    chars.each_with_index do |char, idx|
      raise UnknownRomanNumberError, "'#{char}' is not defined in roman numbers" if !CONVERSION[char]

      current_value = CONVERSION[char]
      next_char = chars[idx+1]
      next_value = CONVERSION[next_char]

      if next_value && next_value >= current_value
        if next_value > current_value
          sub_down += current_value
        elsif next_value == current_value
          sum_up += current_value
        end
      else
        result = result + current_value + sum_up - sub_down

        sum_up = 0
        sub_down = 0
      end
    end

    result
  end

  # @deprecated
  #  Use .to_arabic instead.
  def self.to_arabian(str)
    to_arabic(str)
  end
end
