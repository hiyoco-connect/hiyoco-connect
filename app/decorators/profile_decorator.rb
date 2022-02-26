class ProfileDecorator < Draper::Decorator
  delegate_all

  def get_avatar_url
    if object.avatar?
      object.avatar.url
    elsif object.user.remote_avatar_url?
      object.user.remote_avatar_url
    else
      'default_avatar.png'
    end
  end
end
