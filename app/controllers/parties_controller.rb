class PartiesController < ApplicationController
  def new
    @viewing_party = Party.new
  end

  def create; end
end
