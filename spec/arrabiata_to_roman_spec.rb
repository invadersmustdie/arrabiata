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

  it "should convert 3 to III" do
    Arrabiata.to_roman(3).should == "III"
  end

  it "should convert 8 to VIII" do
    Arrabiata.to_roman(8).should == "VIII"
  end

  it "should convert 1000 to M" do
    Arrabiata.to_roman(1000).should == "M"
  end

  it "should convert 1003 to M" do
    Arrabiata.to_roman(1003).should == "MIII"
  end

  it "should convert 2855 to MMDCCCLV" do
    Arrabiata.to_roman(2855).should == "MMDCCCLV"
  end
end
