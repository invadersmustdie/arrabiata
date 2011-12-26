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

  it "should convert III to 3" do
    Arrabiata.to_arabic("III").should == 3
  end

  it "should convert VIII to 8" do
    Arrabiata.to_arabic("VIII").should == 8
  end

  it "should convert M to 1000" do
    Arrabiata.to_arabic("M").should == 1000
  end

  it "should convert MIII to 1003" do
    Arrabiata.to_arabic("MIII").should == 1003
  end

  it "should convert MMDCCCLV to 2855 " do
    Arrabiata.to_arabic("MMDCCCLV").should == 2855
  end
end
