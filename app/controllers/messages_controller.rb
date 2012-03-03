class MessagesController < ApplicationController
  def index
    @messages = current_user.received_messages
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @message = ActsAsMessageable::Message.new
  end

  def create
    @to = User.find_by_email(params[:to])
    current_user.send_message(@to, params[:topic], params[:body])
  end
end
