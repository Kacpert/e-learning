#Controller should first call method #is_sender_permitted?

class ComplementMessageDataService
  attr_reader :params
  def initialize(params, user)
    @sender = user
    @params = params
  end

  def user_ids
    @user_ids ||= ([@sender.id] + params[:user_ids].to_a)
  end

  def create_conversation
    @conversation ||= Conversation.create(user_ids: user_ids)
  end

  # def find_users_by_logins
  #   params[:user_ids] = User.where(login: params[:user_logins]).map(&:id)
  # end

#not single responsibility to avoid unnecessary premission check 
  def find_or_create_conversation_and_check_sender_permitted?
    unless params[:conversation_id].present?
      create_conversation
      true
    else
      unless (@conversation = Conversation.find_by(id: params[:conversation_id]))
        return 'User try send message to non-existent conversation'
      end
      unless @conversation.users.include?(@sender)
        return 'User is not permitted to send in this conversation messages.'
      end
      true
    end
  end

  def from_date courses
    courses.where('created_at >= ?', @filter.from_date)
  end


  def courses
    courses = (@filter.user_dependency && @user ) ? @user.courses : Course.all
    courses = from_date courses if @filter.from_date.present?
    return courses
  end
end

