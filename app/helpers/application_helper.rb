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

  def ApplicationHelper.cookie_id_to_int(cookies)
    cookie_id = get_cookie_id(cookies)

    decoded = Base64.decode64(cookie_id)
    unpacked = decoded.unpack("q*")
    if unpacked.length == 0 then
      return 0
    else
      return unpacked.first
    end
  end

end
