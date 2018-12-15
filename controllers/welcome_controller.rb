class WelcomeController < ApplicationController
  layout 'start'
  def main
    @heading = "Welcome to ToDoS - Online T0-D0 task management site"
    @details = "Sign-up and create your tasks online! Access them from anywhere!"
  end
end
