module Student
  def self.issue_book(books, student_books)
    puts "\n\t\t\t -----ISSUE BOOK-----"
    puts "Enter Book Name:"
    @name = gets.chomp()
    if books.find {|book| book.name == name}
      @index = books.index { |book| book.name == name }
      @borrow_book = books.delete_at(@index)
      student_books << @borrow_book
    else
      puts "\n\t Book \"#{@name}\" is NOT availabe "
    end
    # student_books
  end

  def self.return_book(books, student_books)
    puts "\n\t\t\t -----RETURN BOOK TO LIBRARY-----"
    puts "Enter Book Name:"
    @name = gets.chomp()
    if student_books.nil?
      puts "No Book"
    elsif student_books.find { |book| book.name == @name }
      @index = student_books.index { |book| book.name == @name }
      @return_book = student_books.delete_at(@index)
      books << @return_book
    else
      puts "Book not found"
    end
    # books
  end

  def self.display_student_books(student_books)
    puts "\n\t\t\t -----DISPLAY STUDENT BOOK-----\n\n"
    if student_books.nil?
      puts "No Book"
    else
      student_books.each_with_index do |book, index|
        puts "BOOK NUMBER #{index + 1} :=> "
        puts "\t\tBook name => #{student_book.name}"
        puts "\t\tBook author => #{student_book.author}"
        puts "\t\tBook price => #{student_book.price}"
        puts "\t\t add time => #{student_book.time}"
        puts "\n"
      end
    end
  end

  def self.search_book(books)
    puts "\n\t\t\t -----SEARCH BOOK-----"
    puts "Enter Book name:"
    @name = gets.chomp()
    if books.find {|book| book.name == @name}
      @index = books.index { |book| book.name == @name }
      puts "\t\tBook name => #{books[@index].name}"
      puts "\t\tBook author => #{books[@index].author}"
      puts "\t\tBook price => #{books[@index].price}"
      puts "\t\t add time => #{books[@index].time}"
    else
      puts "\n\t Book \"#{@name}\" is NOT availabe "
    end
  end
end
