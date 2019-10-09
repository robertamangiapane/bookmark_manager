require 'sinatra/base'
require_relative './lib/bookmarks_service'

class BookmarkManager < Sinatra::Base
  before do
    @bookmarks_service = BookmarksService.instance
  end

  get '/' do
    @bookmarks_service = BookmarksService.create
    erb(:index)
  end

  get '/all_bookmarks' do
    @bookmarks = @bookmarks_service.show_all
    erb(:all_bookmarks)
  end

  get '/add_bookmark' do
    erb(:add_bookmark)
  end

  post '/add_bookmark' do
    @bookmarks_service.add_bookmark(params[:bookmark])
    redirect '/'
  end



run! if app_file == $0

end
