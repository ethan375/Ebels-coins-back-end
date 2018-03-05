require 'sinatra/base'
require 'sinatra/activerecord'


# controllers
require './controllers/ApplicationController'
require './controllers/CoinController'
require './controllers/CommentController'
require './controllers/UserController'

# models
require './models/CoinModel'
require './models/UserModel'
require './models/CommentModel'


map ('/') {
  run ApplicationController
}

map ('/coins'){
  run CoinController
}

map ('/users'){
  run UserController
}

map ('/comments'){
  run CommentController
}