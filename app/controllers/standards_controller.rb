class StandardsController < ApplicationController
  def index
    @standards = Standard.all
  end
end
