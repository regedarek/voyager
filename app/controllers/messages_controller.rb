class MessagesController < ApplicationController
  def index
    @messages = current_user.received_messages
  end

  def outbox
    @messages = current_user.sent_messages
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    @message = current_user.messages.with_id(params[:id]).first
    if @message.destroy
      flash[:notice] = "All ok"
    else
      flash[:error] = "Fail"
    end

    redirect_to messages_path
  end

  def new
    @message = ActsAsMessageable::Message.new
  end

  def create
    @to = User.find_by_email(params[:message][:to])
    current_user.send_message(@to, params[:message][:topic], params[:message][:body])
    redirect_to root_url
  end
end
