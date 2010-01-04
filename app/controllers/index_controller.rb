class IndexController < ApplicationController
  def index
    @feeds = Feed.recent
  end
end
