require "spec_helper"

describe "Arrabiata -> to_roman" do
  it "should fail on 0 because its not included in roman numerals" do
    lambda { 
      Arrabiata.to_roman(0)
    }.should raise_error(Arrabiata::NoZeroInRomanNumbers, "roman numeral system doesn't include 0")
  end

  it "should fail on invalid argument passed" do
    lambda {
      Arrabiata.to_roman(4.2)
    }.should raise_error(ArgumentError, "first argument is not a Fixnum")
  end

  arabic_to_roman_map = {
    3 => "III",
    8 => "VIII",
    1000 => "M",
    1003 => "MIII",
    2855 => "MMDCCCLV",
    79 => "LXXIX",
    4 => "IV",
    19 => "XIX",
    8759 => "MMMMMMMMDCCLIX"
  }

  arabic_to_roman_map.each do |arabic, roman|
    it "should convert #{arabic} to #{roman}" do
      Arrabiata.to_roman(arabic).should == roman
    end
  end
end
