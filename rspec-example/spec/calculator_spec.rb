require 'rspec'
require_relative '../calculator'

# everything happens in the describe() method
describe Calculator do

  # stuff do do before - create the Instance variable of a new Class we are testing
  before { @calculator = Calculator.new('RSpec calculator')}

  #  "it" is the rspec.it() method - show the text
  it "method .add() should add 2 numbers correctly" do
    # actual testing logic
    # expect is similar to the assert with the Test::Unit   feature
  	expect(@calculator.add(2, 2)).to eq 4 
  end
  	
  it "method .subtract() should subtract 2 numbers correctly" do
   expect(@calculator.subtract(4, 2)).to eq 2 
  end  

  #  "hangs" the  "to" and "not_to" methods on all outcomes of "expect"  
  it "testing : sum of two odd numbers and become even" do
   expect(@calculator.add(3, 3)).to be_even 
   expect(@calculator.add(3, 3)).not_to be_odd 
  end

  it "testing input is  zero" do
    expect( @calculator.iszero(1)).to be_falsey     # be_truthy
  end
end