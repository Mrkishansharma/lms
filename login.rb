module Login
  @ADMINUSER = "admin"
  @ADMINPASSWORD = "admin123"
  @USER = "user"
  @USERPASSWORD = "user123"
  def self.account
    puts "\n\n Please enter your username: "
    @username = gets.chomp()
    puts "\n Please enter your password:"
    @password = gets.chomp()
    if @username.eql?(@ADMINUSER) && @password.eql?(@ADMINPASSWORD)
      "admin"
    elsif @username.eql?(@USER) && @password.eql?(@USERPASSWORD)
      "user"
    else
      "ERROR! Invalid username and password."
    end
  end
end
