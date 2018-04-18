class CommentController < ApplicationController

  get '/' do 
    @comment = Comment.all
    @comment.to_json
  end 

  post '/' do 
     payload_body = request.body.read
     payload = JSON.parse(payload_body).symbolize_keys
     @comment = Comment.new
     @comment.username = payload[:username]
     @comment.body = payload[:body]
     @comment.save 
     # @comment.to_json


     resp = {
       status: {
         success: true
       },
       comment: @comment
     }
     resp.to_json
  end 
end 
