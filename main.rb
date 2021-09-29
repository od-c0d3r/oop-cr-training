require_relative './teacher'
require_relative './student'
require_relative './person'
require_relative './book'
class App
  def initialize
    @rentals = []
    @people = []
    @books = []
  end

  def all_books
    if @books.length.positive?
      @books.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
    else
      puts 'No books in library'
    end
  end

  def all_people
    if @people.length.positive?
      @people.each { |person| puts "Name: #{person.name}, Age: #{person.age}" }
    else
      puts 'No people in library'
    end
  end
end
