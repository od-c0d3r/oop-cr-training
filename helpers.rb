def display_options
  puts 'Please choose an option by entering the corresponding number:'
  puts '1 - List all books'
  puts '2 - List all people'
  puts '3 - Create a person'
  puts '4 - Create a book'
  puts '5 - Create a rental'
  puts '6 - List all rentals for a given person id'
  puts "7 - Exit\n\n"
  print 'Enter your selection: '
end

def action(app, response)
  case response
  when 1 then app.all_books
  when 2 then app.all_people
  when 3 then app.create_person
  when 4 then app.create_book
  when 5 then app.create_rental
  when 6 then app.list_rentals
  else puts "\nInvalid Option\n\n"
  end
end
