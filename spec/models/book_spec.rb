require "rails_helper"

RSpec.describe Book, :type => :model do
  it "has a valid book" do
    bookie = Book.create!(title: "The Tale of a Dev", price: 10)
    expect(bookie).to be_valid
  end
end
