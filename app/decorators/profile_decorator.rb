class ProfileDecorator < Draper::Decorator
  delegate_all

  def check_avatar 
    if object.avatar? 
      object.avatar.url
    else
      if !object.user.remote_avatar_url? 
        'default_avatar.png'
      else
        object.user.remote_avatar_url
      end  
    end 
  end
end