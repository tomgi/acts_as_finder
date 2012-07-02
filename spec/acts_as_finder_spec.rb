require 'spec_helper'

describe "acts_as_finder" do
  it "finds record by given field" do
    Currency.EUR.should == Currency.find_by_short_name('EUR')
  end

  context "tries to invoke method from upper class before finding" do
    it "returns base result if base method exists" do
      ActiveRecord::Base.should_receive(:EUR).and_return(:ok)
      Currency.EUR.should == :ok
    end
    it "raises error if base method and record don't exist" do
      expect{Currency.TEST}.to raise_error(NameError)
    end
  end

  context "can find by many fields" do
    context "#invoking acts_as_finder once passing two fields" do
      it "returns record found by first field if exists" do
        Language.EN.should == Language.find_by_short_name('EN')
      end

      it "searches by second field if nothing was found by first field " do
        Language.English.should == Language.find_by_name('English')
      end
    end

    context "#invoking acts_as_finder twice with different fields" do
      it "returns record found by first field if exists" do
        Country.EN.should == Country.find_by_short_name('EN')
      end

      it "searches by second field if nothing was found by first field " do
        Country.England.should == Country.find_by_name('England')
      end
    end
  end

  context 'has records fields values included in #methods' do
    it 'one field' do
      Currency.methods.should include(:EUR, :PLN)
    end

    it 'two fields' do
      Language.methods.should include(:EN, :PL, :English, :Polish)
    end

    it 'includes also base methods' do
      ActiveRecord::Base.should_receive(:methods).and_return([:ok])
      Language.methods.should include(:ok)
    end
  end
end