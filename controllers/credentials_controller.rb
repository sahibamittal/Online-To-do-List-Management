class CredentialsController < ApplicationController
  layout 'start'
  def signup
    @fname = params[:firstname]
    @lname = params[:lastname]
    @age = params[:age]
    @email_id = params[:email_id]
    @username = params[:username]
    @password = params[:password]
    @validemail = "yes"
    # validating the email_address using regex
    # creating a new row in table 'User' if email is valid
      if @fname&&(@email_id =~ /\A[\w]([^@\s,;]+)@(([\w-]+\.)+(com))\z/i) then @user = User.create({:fname => @fname, :lname => @lname, :age => @age, :email_id => @email_id, :username => @username, :password => @password})
      else @validemail = "no"
      end
  end

  def login
    @username = params[:username]
    @password = params[:password]
    @user = nil
    if @username && @password then User.all.each {|user| if user.username == @username && user.password == @password then @user = user end}
      if @user then render "tasks/show"
      end
    end
  end
end
