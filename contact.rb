require 'csv'
require 'pry'


# Represents a person in an address book.
class Contact

  attr_accessor :name, :email
  

  def initialize(name, email)
    CSV.open('./contacts.csv','a') do |csv|
        csv << [name, email]
    end
    # TODO: Assign parameter values to instance variables.
  end

  # Provides functionality for managing a list of Contacts in a database.
  class << self

    # Returns an Array of Contacts loaded from the database.
    def all
      count = 0
      contact_info = ''
      # TODO: Return an Array of Contact instances made from the data in 'contacts.csv'.
      CSV.foreach('./contacts.csv') do |row|
        line = "#{row[0]}, (#{row[1]})"
        count += 1
        contact_info << "\n#{count}: #{line}"
      end
      contact_info
    end

    # Creates a new contact, adding it to the database, returning the new contact.
    def create(name, email)
      Contact.new(name, email)
      # TODO: Instantiate a Contact, add its data to the 'contacts.csv' file, and return it.
    end

    # Returns the contact with the specified id. If no contact has the id, returns nil.
    def find(id)
      count = 1
      contact = ''
      id = id.to_i
      CSV.foreach('./contacts.csv') do |row|
        if count == (id.to_i)
          return contact = "#{row[0]}, (#{row[1]})"
        end
          count += 1
      end

      if contact == ''
        contact = "Contact DNE, sorry"
      end
      contact
      # TODO: Find the Contact in the 'contacts.csv' file with the matching id.
    end
    # Returns an array of contacts who match the given term.
    def search(term)
      listing = ''
      CSV.foreach('./contacts.csv') do |row|
        line = "#{row[0]}, (#{row[1]})"
        # line.downcase
        if line.downcase.match(/.*#{term.downcase}.*/)  
          listing << "\n#{row[0]}, (#{row[1]})"
        end
      end
      if listing == ''
        listing = "No matches to your keyword."
      end
      listing
      # TODO: Select the Contact instances from the 'contacts.csv' file whose name or email attributes contain the search term.
    end
  end

end