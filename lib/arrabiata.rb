class Arrabiata
  class ArrabiataError < StandardError; end
  class NoZeroInRomanNumbers < ArrabiataError; end
  class UnknownRomanNumberError < ArrabiataError; end

  CONVERSION = {
    "M" => 1000,
    "D" => 500,
    "C" => 100,
    "L" => 50,
    "X" => 10,
    "V" => 5,
    "I" => 1
  }

  def self.to_roman(n)
    raise ArgumentError, "first argument is not a Fixnum" if !n.is_a?(Fixnum)
    raise NoZeroInRomanNumbers, "roman numeral system doesn't include 0" if n == 0

    result = ""

    # NOTE: this version doesn't yet respects the subtractive principle
    CONVERSION.sort_by { |d| d.last }.reverse.each do |k|
      x = n / k.last
      if x != 0
        result << k.first * x
        n = n - x * k.last
      end
    end

    result
  end

  def self.to_arabian(str)
    raise ArgumentError, "first argument is not a String" if !str.is_a?(String)

    result = 0

    str.scan(/\w/).each do |char|
      raise UnknownRomanNumberError, "'#{char}' is not defined in roman numbers" if !CONVERSION[char]
      result = result + CONVERSION[char]
    end

    result
  end
end
