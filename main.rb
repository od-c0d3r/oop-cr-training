# rubocop:disable Metrics/MethodLength
# rubocop:disable Metrics/CyclomaticComplexity
# rubocop:disable Metrics/PerceivedComplexity
# rubocop:disable Metrics/AbcSize

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
      @books.each { |book| puts "Title: \"#{book.title}\" Author: #{book.author}" }
    else
      puts 'No books in library'
    end
  end

  def all_people
    if @people.length.positive?
      @people.each { |person| puts "Name: \"#{person.name}\" Age: #{person.age}" }
    else
      puts 'No people in library'
    end
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    person_type = gets.chomp
      if person_type != '1' && person_type != '2'
        puts 'Invalid Option'
        return
      end
      print 'Age: '
      age = gets.chomp.to_i
      print 'Name: '
      name = gets.chomp
      person =
        if person_type == '1'
          print 'Has parent permission? [Y/N]: '
          parent_permission = gets.chomp
          parent_permission = parent_permission.downcase == 'y'
          Student.new(age, name, parent_permission)
        elsif person_type == '2'
          print 'Specialization: '
          specialization = gets.chomp
          Teacher.new(age, specialization, name)
        end
      @people << person
      puts 'Person created successfully!'
  end

  def create_book
    print 'Title: '
    title = gets.chomp

    print 'Author: '
    author = gets.chomp

    book = Book.new(title, author)
    @books << book
    puts 'Book created successfully!'
  end

  def create_rental
    puts 'Select a book from the following list by number'
    @books.each_with_index { |book, index| puts "#{index}) Title: \"#{book.title}\" Author: #{book.author}" }
    book_index = gets.chomp.to_i

    puts "\nSelect a person from the following list by number (not id)"

    @people.each_with_index { |person, index| puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
    person_index = gets.chomp.to_i

    print "\nDate: "
    date = gets.chomp

    @rentals << Rental.new(date, @booksp[book_index], @people[person_index])
    puts 'Rental created successfully!'
  end

  def list_rentals_for_person_id
    print 'ID of person'

    id = gets.chomp.to_i

    rentals = @rentals.filter { |rental| rental.person.id == id }
    puts 'Rentals: '
    rentals.each { |rental| puts "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}" }
  end
end
