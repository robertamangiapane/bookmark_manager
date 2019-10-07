require 'sinatra/base'

class BookmarkManager < Sinatra::Base

  get '/' do
    'Test working'
  end



run! if app_file == $0

end
