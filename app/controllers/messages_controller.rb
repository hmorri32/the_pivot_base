class MessagesController < ApplicationController

  def create
    message = Message.new(message_params)
    message.user = currrent_user
    if message.save
      ActionCable.server.broadcast 'messages',
        message: message.content,
        user: message.user.email
      head :ok
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :chatroom_id)
  end
end
