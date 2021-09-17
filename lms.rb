Book = Struct.new(:name, :author, :price)
books = []
while true
  puts "\n\n\t\t\tLIBRARY MANAGEMENT SYSTEM"
  puts "\t\t\t--------------------------\n\n"
  puts "\t\t\tMENU:-"
  puts "\t\t\t 1.add books"
  puts "\t\t\t 2.delete books"
  puts "\t\t\t 3.display books"
  puts "\t\t\t 4.search books"
  puts "\t\t\t 5.exit books\n\n"
  puts "\n Enter Your Choice: "
  choice = gets.chomp()
  if choice == "1"
    puts "\n\t\t\tADD BOOK"
    p "how many books add: "
    n = gets.chomp().to_i
    n.times do
      p "Enter book name : "
      name = gets.chomp()
      p "Enter book author : "
      author = gets.chomp()
      p "Enter book price : "
      price = gets.chomp()
      data = Book.new(name, author, price)
      books << data
    end
  elsif choice == "2"
    puts "\n\t\t\tDELETE BOOK\n"
    p "Enter book name which you want to delet: "
    data = gets.chomp()
    data = books.find { |iapp| iapp.name == data}
    books.delete(data) unless data.nil?
  elsif choice == "3"
    puts "\n\t\t\tDISPLAY BOOK"
    p "\n"
    books.each_with_index do |book, index|
      puts "BOOK NUMBER #{index + 1} :=> "
      puts "\t\tBook name => #{book.name}"
      puts "\t\tBook author => #{book.author}"
      puts "\t\tBook price => #{book.price}"
      puts "\n"
    end
  elsif choice == "4"
    puts "\n\t\t\tSEARCH BOOK\n"
    p "Enter book name: "
    name = gets.chomp()
    if books.find {|book| book.name == name}
      puts "\n\t Book \"#{name}\" is availabe "
    else
      puts "\n\t Book \"#{name}\" is NOT availabe "
    end

  elsif choice == "5"
    puts "\n\n\t\tThank you for exit"
    break
  else
    p "\n\t\t\t Enter valid choice (1 to 5): \n\n"
    puts "\n"
  end
end
