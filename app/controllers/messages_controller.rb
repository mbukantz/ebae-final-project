class MessagesController < ApplicationController

  def index
    @user = current_user
  end

  def new
    @user = current_user
    @message = Message.new
    @listing = Listing.find_by(id: params[:listing_id])
    @conversation = Conversation.find_by(id: params[:conversation_id])
  end

  def create
    message = Message.new(message_params)
    if message.save
      redirect_to message.listing
    end
    
  end

  def show
    @message = Message.find(params[:id])
  end

  private

  def message_params
    params.require(:message).permit(:subject, :content, :recipient_id, :sender_id, :conversation_id, conversation_attributes: [:listing_id, :initiator_id, :noninitiator_id])
  end

end
