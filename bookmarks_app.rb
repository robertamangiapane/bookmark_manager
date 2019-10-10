require 'sinatra/base'
require_relative './lib/bookmark'

class BookmarkManager < Sinatra::Base
  enable :method_override, :sessions

  before do
    @bookmarks_manager = Bookmark
  end

  get '/' do
    @bookmarks = @bookmarks_manager.show_all
    erb :"bookmarks/index"
  end

  get '/bookmarks/new' do
    erb :"bookmarks/new"
  end

  post '/bookmarks' do
    @bookmarks_manager.create(url: params[:url], title: params[:title])
    redirect '/'
  end

  delete '/bookmarks/:id' do
    @bookmarks_manager.delete(id: params[:id])
    redirect '/'
  end

  get '/bookmarks/:id/edit' do
    @bookmark = @bookmarks_manager.find(id: params[:id])
    erb :"bookmarks/edit"
  end

  patch '/bookmarks/:id' do
    @bookmark = @bookmarks_manager.update(id: params[:id], title: params[:title], url: params[:url])
    redirect('/')
  end

run! if app_file == $0

end
