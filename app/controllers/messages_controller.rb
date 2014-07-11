class MessagesController < ApplicationController

  before_action :get_message, only: [:show, :edit, :update, :destroy]

  def index
    @messages = Message.latest_first
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new message_params

    if @message.save
      send_or_not(@message)
    else
      render :new
    end
  end

  def show
  end

  def edit
    @message.draft = false
    render action: 'new'
  end

  def update
    if @message.update_attributes(message_params)
      send_or_not(@message)
    else
      render :edit
    end
  end

  def destroy
    @message = Message.find params[:id]
    @message.destroy
    redirect_to messages_path
  end

  private

  def send_or_not(message)
    MessageMailer.send_message(message).deliver unless message.draft?
    what = message.draft? ? 'saved' : 'sent'
    redirect_to root_path, notice: "Message was successfully #{what}."
  end

  def get_message
    @message = Message.find params[:id]
  end

  def message_params
    params.require(:message).permit(:to, :subject, :body, :attachment, :draft)
  end
end
