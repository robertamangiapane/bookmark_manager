require 'sinatra/base'
require_relative './lib/bookmark'

class BookmarkManager < Sinatra::Base
  before do
    @bookmarks_manager = Bookmark
  end

  get '/' do
    erb(:index)
  end

  get '/bookmarks' do
    @bookmarks = @bookmarks_manager.show_all
    erb(:bookmarks)
  end

  get '/bookmarks/new' do
    erb(:add_bookmark)
  end

  post '/bookmarks/new' do
    @bookmarks_manager.create(url: params[:url], title: params[:title])
    redirect '/bookmarks'
  end



run! if app_file == $0

end
