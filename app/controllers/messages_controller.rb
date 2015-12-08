class MessagesController < ApplicationController

  def index
    @user = current_user
    @message = Message.new
  end

  def new
    # session[:return_to] ||= request.referer
    @user = current_user
    # @reply_message = Message.find_by(id: session[:message_id])
    # session[:message_id] = nil
    @msg = Message.new
    @listing = Listing.find_by(id: params[:listing_id])
    @conversation = Conversation.find_by(listing_id: @listing.id, initiator_id: @user.id, noninitiator_id:@listing.seller.user.id)
  end

  def create
    message = Message.new(message_params)
    if message.save
      redirect_to messages_path
      # redirect_to session.delete(:return_to)
    end
  end

  def show
    @user = current_user
    @msg = Message.new
    @listing = Listing.find_by(id: params[:listing_id])
    @message = Message.find(params[:id])
    @conversation = @message.conversation
    session[:message_id] = @message.id
    if @message.recipient == current_user
      @message.read_at = Time.now.utc
      @message.save
    end
  end

  def update
    @message = Message.find(params[:id])
    @message.update(message_params)
    redirect_to messages_path
  end

  def update_multiple
    selected_messages = params[:message_ids].select{|k,v| v == "1"}
    messages = Message.find(selected_messages.keys)
    messages.each do |message|
      if current_user == message.sender
        message.sender_deleted = true
      else
        message.recipient_deleted = true
      end
      message.save
    end
    redirect_to messages_path
  end

  private

  def message_params
    params.require(:message).permit(:subject, :content, :recipient_id, :sender_id, :recipient_deleted, :sender_deleted, :conversation_id, conversation_attributes: [:listing_id, :initiator_id, :noninitiator_id])
  end

end
