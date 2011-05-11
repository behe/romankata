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

  it "should explode 11" do
    11.dec_explode.should == [10, 1]
  end

  it "should explode 1999" do
    1999.dec_explode.should == [1000, 900, 90, 9]
  end

  it "should convert 1999" do
    1999.to_roman.should == "MCMXCIX"
  end

end

class Fixnum

  def to_roman
    dec_explode.map { |n|
      roman_chars[n]
      }.join
    end

    # def dec_explode
    #   n = 1000
    #   rest = self
    #   exploded = []
    #   while n > 0
    #     x = rest / n
    #     exploded << x*n if x > 0
    #     rest = rest - x*n
    #     n = n/10
    #   end
    #   exploded
    # end
    
    def dec_explode
      n = 1
      exploded = self.to_s.split(//).reverse.map{|i|
        x = i.to_i*n
        n=n*10
        x
      }.reverse
    end

    private

    def roman_chars
      {
        1 => "I", 
        2 => "II", 
        3 => "III", 
        4 => "IV", 
        5 => "V", 
        6 => "VI", 
        7 => "VII", 
        8 => "VIII", 
        9 => "IX", 
        10 => "X", 
        20 => "XX", 
        30 => "XXX", 
        40 => "XL", 
        50 => "L", 
        60 => "LX", 
        70 => "LXX", 
        80 => "LXXX", 
        90 => "XC", 
        100 => "C", 
        200 => "CC", 
        300 => "CCC", 
        400 => "CD", 
        500 => "D", 
        600 => "DC", 
        700 => "DCC", 
        800 => "DCCC", 
        900 => "CM", 
        1000 => "M", 
        2000 => "MM", 
        3000 => "MMM"
      }
    end
  end