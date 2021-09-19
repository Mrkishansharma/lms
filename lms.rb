ADMINUSER = "admin"
ADMINPASSWORD = "admin123"

USER = "student"
USERPASSWORD = "student123"

Book = Struct.new(:name, :author, :price, :time)
books = []
student_books = []

outerChoice = 0


while outerChoice != 9
  puts "\n\n\t\t\tLIBRARY MANAGEMENT SYSTEM"
  puts "\t\t\t--------------------------\n\n"
  puts "\t\t\t 1. Admin"
  puts "\t\t\t 2. Student"
  puts "\t\t\t 9. exit\n"
  puts "Enter Your Choice:"
  outerChoice = gets.chomp().to_i
  if outerChoice == 1
    adminUser = []
    adminPassword = []

    puts "**********************************************************************\n"
    puts "\n\t\t\t ---------- Admin Login -------"
    puts "\n\n Please enter your username: "
    adminUser = gets.chomp()
    puts "\n Please enter your password:"
    adminPassword = gets.chomp()
    puts "**********************************************************************\n"

    if adminUser.eql?(ADMINUSER) && adminPassword.eql?(ADMINPASSWORD)
      innerChoice = 0
      while (innerChoice != 9)

        puts "**********************************************************************\n"
        puts "\n\t\t\t Admin Login is Successful !! Press any button to continue..."
        puts "\t\t\t --------------------------------------------------------------------\n\n"
        puts "\t\t\t 1. Add new book"
        puts "\t\t\t 2. Count All Books"
        puts "\t\t\t 3. Delete Book"
        puts "\t\t\t 4. List of all Books"
        puts "\t\t\t 9. Back"
        puts "Enter Your Choice:"
        innerChoice = gets.chomp().to_i
        puts "**********************************************************************\n"

        case innerChoice
        when 1

          puts "**********************************************************************\n"
          puts "\n\n\t\t\t -----ADD BOOK-----"
          puts "Enter book name : "
          name = gets.chomp()
          puts "Enter book author : "
          author = gets.chomp()
          puts "Enter book price : "
          price = gets.chomp().to_i
          time = Time.now
          data = Book.new(name, author, price, time.ctime)
          books << data
          puts "\nBook Save Successfully\n\n"
          puts "**********************************************************************\n"

        when 2

          puts "**********************************************************************\n"
          puts "\n\t\t\t -----Count Books-----"
          puts "\nTotal Books => #{books.length}"
          puts "**********************************************************************\n"

        when 3

          puts "**********************************************************************\n"
          puts "\n\n\t\t\t -----DELETE BOOK-----"
          puts "Enter book name which you want to delet: "
          data = gets.chomp()
          data = books.find { |iapp| iapp.name == data}
          books.delete(data) unless data.nil?
          puts "**********************************************************************\n"

        when 4

          puts "**********************************************************************\n"
          puts "\n\t\t\t -----DISPLAY BOOK-----"
          books.each_with_index do |book, index|
            puts "BOOK NUMBER #{index + 1} :=> "
            puts "\t\tBook name => #{book.name}"
            puts "\t\tBook author => #{book.author}"
            puts "\t\tBook price => #{book.price}"
            puts "\t\t add time => #{book.time}"
            puts "\n"
          end
          puts "**********************************************************************\n"

        when 9

          puts "**********************************************************************\n"
          puts "\n\n\t\t\t\t Thank You! For Exit()"
          puts "**********************************************************************\n"
          break

        else

          puts "**********************************************************************\n"
          puts "\n\nError! invalid choice\n\n "
          puts "**********************************************************************\n"

        end
      end
    else

      puts "**********************************************************************\n"
      puts "\nError! invalid username and password:"
      puts "**********************************************************************\n"

    end
  elsif outerChoice == 2
      stuudentUser = []
      studentPassword = []

      puts "**********************************************************************\n"
      puts "\n\t\t\t ---------- student Login -------"
      puts "\n\n Please enter your username: "
      studentUser = gets.chomp()
      puts "\n Please enter your password:"
      studentPassword = gets.chomp()
      puts "**********************************************************************\n"

      if studentUser.eql?(USER) && studentPassword.eql?(USERPASSWORD)
        innerChoice = 0
        while (innerChoice != 9)

          puts "**********************************************************************\n"
          puts "\n\t\t\t Student Login is Successful !! Press any button to continue..."
          puts "\t\t\t --------------------------------------------------------------------\n\n"
          puts "\t\t\t 1. Borrow a Book "
          puts "\t\t\t 2. Return a Book"
          puts "\t\t\t 3. List of All Books in LIBRARY"
          puts "\t\t\t 4. List Of All Books have STUDENT "
          puts "\t\t\t 5. Search Book"
          puts "\t\t\t 9. Back"
          puts "Enter Your Choice:"
          innerChoice = gets.chomp().to_i
          puts "**********************************************************************\n"

          case innerChoice
          when 1

            puts "**********************************************************************\n"
            puts "\n\t\t\t -----BORROW BOOK-----"
            puts "Enter Book Name:"
            name = gets.chomp()
            if books.find {|book| book.name == name}
              index = books.index { |book| book.name == name }
              borrow_book = books.delete_at(index)
              student_books << borrow_book
            else
              puts "\n\t Book \"#{name}\" is NOT availabe "
            end
            puts "**********************************************************************\n"
          when 2

            puts "**********************************************************************\n"
            puts "\n\t\t\t -----RETURN BOOK TO LIBRARY-----"
            puts "Enter Book Name:"
            name = gets.chomp()
            if student_books.empty?() # || student_books.find { |book| student_book.name != name }
              puts "No Books"
            elsif student_books.find { |book| book.name == name }
              index = student_books.index { |book| book.name == name }
              return_book = student_books.delete_at(index)
              books << return_book
            else
              puts "Book not found"
            end
            puts "**********************************************************************\n"
          when 3

            puts "**********************************************************************\n"
            puts "\n\t\t\t -----DISPLAY BOOK-----"
            books.each_with_index do |book, index|
              puts "BOOK NUMBER #{index + 1} :=> "
              puts "\t\tBook name => #{book.name}"
              puts "\t\tBook author => #{book.author}"
              puts "\t\tBook price => #{book.price}"
              puts "\t\t add time => #{book.time}"
              puts "\n"
            end
            puts "**********************************************************************\n"
          when 4

            puts "**********************************************************************\n"
            puts "\n\t\t\t -----DISPLAY STUDENT BOOK-----\n\n"
            student_books.each {|book| p book }
            puts "\n"
            puts "**********************************************************************\n"
          when 5

            puts "**********************************************************************\n"
            puts "\n\t\t\t -----SEARCH BOOK-----"
            puts "Enter Book name:"
            name = gets.chomp()
            if books.find {|book| book.name == name}
              index = books.index { |book| book.name == name }
              p books[index]
            else
              puts "\n\t Book \"#{name}\" is NOT availabe "
            end
            puts "**********************************************************************\n"
          when 9

            puts "**********************************************************************\n"
            puts "Thank You! For Exit()"
            puts "**********************************************************************\n"
            break

          else

            puts "**********************************************************************\n"
            puts "\n\nError! invalid choice\n\n "
            puts "**********************************************************************\n"

          end
        end
      else

        puts "**********************************************************************\n"
        puts "\nError! invalid username and password:"
        puts "**********************************************************************\n"

      end
  elsif outerChoice != 9

    puts "**********************************************************************\n"
    puts "\n\n Invalid choice. Press any key to continue.."
    puts "**********************************************************************\n"

  else

    puts "**********************************************************************\n"
    puts "\n\n Thank you for using it !! Press any key to exit"
    puts "**********************************************************************\n"
    break

  end
end
