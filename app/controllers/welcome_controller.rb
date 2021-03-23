class WelcomeController < ApplicationController
  def index
    @intro = helpers.intro
  end
end
