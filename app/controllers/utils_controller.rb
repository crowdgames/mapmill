class UtilsController < ApplicationController
  def consent
  end

  NUM_SITES = 4

  def agree
    # randomly choose a site based on cookie
    new_site_id = 1 + (::ApplicationHelper::get_cookie_id(cookies).gsub(/[^0-9]/, "").to_i % NUM_SITES)

    # make full URL
    @new_site_url = request.base_url + "/sites/" + new_site_id.to_s

    # do a redirect
    redirect_to(@new_site_url)
  end
  
  def done
    redirect_to("/surveys")
  end
end
