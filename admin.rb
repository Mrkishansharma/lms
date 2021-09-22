module Admin
  @Book = Struct.new(:name, :author, :price, :time)
  def self.add_book(books)
    puts "\n\n\t\t\t -----ADD BOOK-----"
    puts "Enter book name : "
    @name = gets.chomp()
    puts "Enter book author : "
    @author = gets.chomp()
    puts "Enter book price : "
    @price = gets.chomp().to_i
    @time = Time.now
    @data = @Book.new(@name, @author, @price, @time.ctime)
    books << @data
  end
  def self.count_books(books)
    puts "\n\t\t\t -----Count Books-----"
    puts "\nTotal Books => #{books.length}" unless books.nil?
  end
  def self.delete_book(books)
    puts "\n\n\t\t\t -----DELETE BOOK-----"
    puts "Enter book name which you want to delet: "
    @name = gets.chomp()
    @name = books.find { |book| book.name == @name}
    books.delete(@name) unless books.nil?
  end
  def self.display_all_books(books)
    puts "\n\t\t\t -----DISPLAY BOOK-----"
    if books.nil?
      puts "No Books"
    else
      books.each_with_index do |book, index|
        puts "BOOK NUMBER #{index + 1} :=> "
        puts "\t\tBook name => #{book.name}"
        puts "\t\tBook author => #{book.author}"
        puts "\t\tBook price => #{book.price}"
        puts "\t\t add time => #{book.time}"
        puts "\n"
      end
    end
  end
end
