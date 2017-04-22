require 'spec_helper'

RSpec.describe Book, :type => :model do
  #pending "add some examples to (or delete) #{__FILE__}"

  # it "has none to begin with" do
  #   expect(Book.count).to eq 0
  # end
  #
  # it "has one book after adding" do
  #   Book.create
  #   expect(Book.count).to eq 1
  # end
  it {should validate_presence_of(:name)}
  it {should validate_presence_of(:author_name)}

  it "returns the name of the book when string matches" do
    expected_book = Book.new({name: 'Harry Potter'})

    expect(Book).to receive(:where).with("name LIKE ?", '%Harry%').and_return(expected_book)

    expect(Book.search('Harry')).to eq(expected_book)
  end

end
