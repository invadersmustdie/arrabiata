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

    str.scan(/\w/).each do |char|
      raise UnknownRomanNumberError, "'#{char}' is not defined in roman numbers" if !CONVERSION[char]
      result = result + CONVERSION[char]
    end

    result
  end

  # @deprecated
  #  Use .to_arabic instead.
  def self.to_arabian(str)
    to_arabic(str)
  end
end
