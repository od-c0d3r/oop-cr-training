# rubocop:disable Metrics/MethodLength

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
    puts 'Do you want to create a student (1) or a teacher (2)?'
    print 'Select (1) or (2): '
    selection = gets.chomp

    case selection
    when '1'
      print 'Age: '
      age = gets.chomp
      print 'Name: '
      name = gets.chomp
      print 'Has parent permission? [Y/N]: '
      permission = gets.chomp.downcase
      permission = permission == 'y'
      @people << Student.new(age, name, permission)
      puts 'student created successfully'
    when '2'
      print 'Age: '
      age = gets.chomp
      print 'Name: '
      name = gets.chomp
      print 'Specialization: '
      specialization = gets.chomp
      @people << Teacher.new(age, specialization, name)
      puts 'Teacher created successfully'
    else
      puts 'invalid selection'
      nil
    end
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
    @books.each_with_index do |book, index|
      puts "#{index}) Title: \"#{book.title}\", Author: #{book.author}"
    end
    book_index = gets.chomp.to_i

    puts "\nSelect a person from the following list by number (not id)"
    @people.each_with_index do |person, index|
      puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    person_index = gets.chomp.to_i

    print "\nDate: "
    date = gets.chomp

    @rentals << Rental.new(date, @books[book_index], @people[person_index])
    puts 'Rental created successfully'
  end

  def list_rentals_for_person_id
    print 'ID of person'

    id = gets.chomp.to_i

    rentals = @rentals.filter { |rental| rental.person.id == id }
    puts 'Rentals: '
    rentals.each { |rental| puts "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}" }
  end
end
# rubocop:enable Metrics/MethodLength
