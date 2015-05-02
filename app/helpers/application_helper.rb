module ApplicationHelper

  def ApplicationHelper.get_cookie_id(cookies)
    ckey = "_mapmill_voting_"
    if cookies[ckey]
      return cookies[ckey]
    else
      cookie_id = SecureRandom.base64 
      cookies[ckey] = cookie_id
      return cookie_id
    end
  end
  
end
