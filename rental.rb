class Rental
  attr_accessor :date
  attr_reader :book

  def initialize(date, book)
    @date = date
    @book = book
  end

  def book=(book)
    @book = book
    book.rentals.push(self) unless book.rentals.include?(self)
  end
end
