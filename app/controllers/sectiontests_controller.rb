# frozen_string_literal: true

class SectiontestsController < ApplicationController
  #Loginページだけapplication.html.erbを適用せずに
  #新たに作ったindex.html.erb(navとfooter無し)を適用する
  layout 'index'

  def index; end
end
