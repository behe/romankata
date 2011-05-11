# http://codingdojo.org/cgi-bin/wiki.pl?KataRomanNumerals

describe "Numeric to roman" do
  it "should convert digits" do
    1.to_roman.should == "I"
    2.to_roman.should == "II"
    3.to_roman.should == "III"
    4.to_roman.should == "IV"
    5.to_roman.should == "V"
    6.to_roman.should == "VI"
    7.to_roman.should == "VII"
    8.to_roman.should == "VIII"
    9.to_roman.should == "IX"
  end

  it "should convert tens" do
    10.to_roman.should == "X"
    20.to_roman.should == "XX"
    30.to_roman.should == "XXX"
    40.to_roman.should == "XL"
    50.to_roman.should == "L"
    60.to_roman.should == "LX"
    70.to_roman.should == "LXX"
    80.to_roman.should == "LXXX"
    90.to_roman.should == "XC"
  end

  it "should get IVX for 1-9" do
    1.level.should == ["I", "V", "X"]
    9.level.should == ["I", "V", "X"]
  end

  it "should get XLC for 10-99" do
    10.level.should == ["X", "L", "C"]
    99.level.should == ["X", "L", "C"]
  end
  
  it "should get CDM for 100-999" do
    100.level.should == ["C", "D", "M"]
    999.level.should == ["C", "D", "M"]
  end

  it "should get IVX pattern for 1" do
    1.pattern_for_level.should == ["I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX"]
  end

  it "should convert hundreds" do
    100.to_roman.should == "C"
    200.to_roman.should == "CC"
    300.to_roman.should == "CCC"
    400.to_roman.should == "CD"
    500.to_roman.should == "D"
    600.to_roman.should == "DC"
    700.to_roman.should == "DCC"
    800.to_roman.should == "DCCC"
    900.to_roman.should == "CM"
  end

  it "should convert thousands" do
    1000.to_roman.should == "M"
    2000.to_roman.should == "MM"
    3000.to_roman.should == "MMM"
  end
  
  it "should convert 11" do
    11.to_roman.should == "XI"
  end

  it "should convert 1999" do
    1999.to_roman.should == "MCMXCIX"
  end
end

class Fixnum
  def to_roman
    dec_explode.map { |n|
      @pattern = pattern_for_level(n)
      i = n/10**(n.to_s.size-1)
      @pattern[i-1]
    }.join
  end

  def dec_explode
    n = 1
    exploded = self.to_s.split(//).reverse.map{|i|
      x = i.to_i*n
      n=n*10
      x
    }.reverse.reject{|i| i == 0}
  end

  def level(x = self)
    n = (x.to_s.size-1) * 2
    levels[n..n+2]
  end

  def pattern_for_level(n = self)
    levels = level(n)
    pattern.map!{|p|
      p = p.gsub('X', levels[2]).gsub('V', levels[1]) if levels.size == 3
      p.gsub('I', levels[0])
    }
  end

  private

  def pattern
    ["I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX"]
  end

  def levels
    ["I", "V", "X", "L", "C", "D", "M"]
  end

end
