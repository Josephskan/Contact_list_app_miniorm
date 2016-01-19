require_relative 'contact'

# Interfaces between a user and their contact list. Reads from and writes to standard I/O.
class ContactList

  # TODO: Implement user interaction. This should be the only file where you use `puts` and `gets`.

  def self.menu_interface
    puts
    puts "Here is a list of available commands:"
    puts
    puts "\tnew - Create a new contact"
    puts
    puts "\tlist - List all contacts"
    puts
    puts "\tshow - Show a contact"
    puts
    puts "\tsearch - Search contacts"
    puts

    cmd = gets.chomp
    if /new/ =~ cmd
      puts "Please enter contact full name:"
      name = gets.chomp
      puts "Now enter contact's email"
      email = gets.chomp
      Contact.create(name, email)
    elsif /list/ =~ cmd
      puts Contact.all

      row_num = 0
      CSV.foreach('./contacts.csv') do |row|
        row_num += 1
      end
      puts "-------------------------------------------------------"
      puts "#{row_num} contacts on record"
      puts
    elsif /show/ =~ cmd
      puts "Enter an ID:" 
      id = gets.chomp
      puts Contact.find(id)
    elsif /search/ =~ cmd
      puts "enter a search keyword"
      keyword = gets.chomp
      puts Contact.search(keyword)
    end
  end

ContactList.menu_interface
end