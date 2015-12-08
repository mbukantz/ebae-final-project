class MessagesController < ApplicationController

  def index
    @user = current_user
  end

  def new
    
    session[:return_to] ||= request.referer
    @user = current_user
    @reply_message = Message.find_by(id: session[:message_id])
    session[:message_id] = nil
    @message = Message.new
    @listing = Listing.find_by(id: params[:listing_id])
    @conversation = Conversation.find_by(id: params[:conversation_id])
  end

  def create
    message = Message.new(message_params)
    if message.save
      # redirect_to message.listing
      redirect_to session.delete(:return_to)
    end
    
  end

  def show
    @message = Message.find(params[:id])
    session[:message_id] = @message.id
  end

  private

  def message_params
    params.require(:message).permit(:subject, :content, :recipient_id, :sender_id, :conversation_id, conversation_attributes: [:listing_id, :initiator_id, :noninitiator_id])
  end

end
