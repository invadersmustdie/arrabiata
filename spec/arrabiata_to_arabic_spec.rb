require "spec_helper"

describe "Arrabiata -> to_arabic" do
  it "should fail on characters not defined in roman numerals" do
    lambda {
      Arrabiata.to_arabic("MVVa")
    }.should raise_error(Arrabiata::UnknownRomanNumberError, "'a' is not defined in roman numbers")
  end

  it "should fail on invalid argument passed" do
    lambda {
      Arrabiata.to_arabic(4.2)
    }.should raise_error(ArgumentError, "first argument is not a String")
  end

  roman_to_arabic_map = {
    "III" => 3,
    "VIII" => 8,
    "M" => 1000,
    "MIII" => 1003,
    "MMDCCCLV" => 2855
  }

  roman_to_arabic_map.each do |roman, arabic|
    it "should convert #{roman} to #{arabic}" do
      Arrabiata.to_arabic(roman).should == arabic
    end
  end
end
