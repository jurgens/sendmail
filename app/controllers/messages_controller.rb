class MessagesController < ApplicationController

  def index
    @messages = Message.latest_first
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new message_params

    if @message.save
      MessageMailer.send_message(@message).deliver
      redirect_to root_path, notice: 'Successfully created message'
    else
      render :new
    end
  end

  private

  def message_params
    params.require(:message).permit(:to, :subject, :body)
  end
end
