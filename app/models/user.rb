class User < ApplicationRecord
    validates :username, presence: true
    validates :mail, presence: true, uniqueness: true , format:{ :with => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i}
    # stack overflow regular expression 
    def self.login(user_info)
      email = user_info[:email]
      password = user_info[:password]
  
      salted_password = "xy#{password.reverse}hellohey"
      encryted_password = Digest::SHA1.hexdigest(salted_password)
  
      self.find_by(email: mail, password: encryted_password)
    end
  
    private
    def encrypt_password
      
      salted_password = "xy#{self.password.reverse}hellohey"
      self.password = Digest::SHA1.hexdigest(salted_password)
    end
  end

 