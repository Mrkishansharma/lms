require_relative "./login"
require_relative "./admin"
require_relative "./student"


class Library
  def initialize
    @books = []
    student_books = []
    @outerChoice = 0
    @innerChoice = 0
    @who_am_i = ""
  end
  def login
    while (@outerChoice != 9)
      puts "\n\nLIBRARY MANAGEMENT SYSTEM\n\n"
      puts " 1. Login"
      puts " 9. exit\n"
      puts "Enter Your Choice:"
      @outerChoice = gets.chomp().to_i
      case @outerChoice
      when 1
        @who_am_i = Login.account
        if @who_am_i.eql?("admin")
          admin
        elsif @who_am_i.eql?("user")
          student
        else
          puts @who_am_i
        end
      when 9
        puts "Thank you"
        break
      else
        puts "choose right option 1 or 9 :"
      end
    end
  end
  def admin
    while (@innerChoice != 9)
      puts " Admin Login is Successful !! Press any button to continue..."
      puts " 1. Add new book"
      puts " 2. Count All Books"
      puts " 3. Delete Book"
      puts " 4. List of all Books"
      puts " 9. Back"
      puts "Enter Your Choice:"
      @innerChoice = gets.chomp().to_i
      case @innerChoice
      when 1
        Admin.add_book(@books)
      when 2
        Admin.count_books(@books)
      when 3
        Admin.delete_book(@books)
      when 4
        Admin.display_all_books(@books)
      when 9
        puts " Thank You! For Back()"
        break
      else
        puts " Error! invalid choice\n\n "
      end
    end
  end
  def student
    while (@innerChoice != 9)
      puts "\n\t\t Student Login is Successful !! Press any button to continue..."
      puts "\t\t\t 1. Issue a Book "
      puts "\t\t\t 2. Return a Book"
      puts "\t\t\t 3. List of All Books in LIBRARY"
      puts "\t\t\t 4. List Of All Books have STUDENT "
      puts "\t\t\t 5. Search Book"
      puts "\t\t\t 9. Back"
      puts "Enter Your Choice:"
      @innerChoice = gets.chomp().to_i
      case @innerChoice
      when 1
        Student.issue_book(@books, @student_books)
      when 2
        Student.return_book(@books, @student_books)
      when 3
        Admin.display_all_books(@books)
      when 4
        Student.display_student_books(@student_books)
      when 5
        Student.search_book(@books)
      when 9
        puts " Thank You! For Exit()"
        break
      else
        puts " Error! invalid choice\n\n   "
      end
    end
  end
end
l = Library.new
l.login
