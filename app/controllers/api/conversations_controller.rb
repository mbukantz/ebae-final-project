class Api::ConversationsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    @conversations = Conversation.all
    render json: @conversations
  end

end
