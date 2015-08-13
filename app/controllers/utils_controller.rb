require 'application_helper'

class UtilsController < ApplicationController

  def submit
    @assignmentId = cookies['assignmentId']
    @hitId = cookies['hitId']
    @workerId = cookies['workerId']
    @turkSubmitTo = cookies['turkSubmitTo']
    @cookie_id = ::ApplicationHelper::get_cookie_id(cookies)  
    votes = Vote.where(cookie: @cookie_id).to_a
    if votes.nil?
      @labels = 0
    else
      @labels = votes.count    
    end
  end
    
  def consent
    assignmentId = params['assignmentId']
    hitId = params['hitId']
    workerId = params['workerId']
    turkSubmitTo = params['turkSubmitTo']
    
    preview = false
    if assignmentId == 'ASSIGNMENT_ID_NOT_AVAILABLE' or assignmentId.nil? or workerId.nil? or hitId.nil? or turkSubmitTo.nil?
       preview = true
    end

    if preview
      @agree_link = 'PLEASE ACCEPT THIS HIT TO CONTINUE'
    else
      @agree_link = "<a href='/utils/agree?assignmentId="+assignmentId+"&hitId="+hitId+"&workerId="+workerId+"&turkSubmitTo="+turkSubmitTo+"'>SURVEY LINK</a>"
    end
  end

  NUM_SITES = 4

  def agree
    cookies['assignmentId']=params['assignmentId']
    cookies['workerId']=params['workerId']
    cookies['hitId']=params['hitId']
    cookies['turkSubmitTo']=params['turkSubmitTo']

    # randomly choose a site based on cookie
    new_site_id = 1 + (::ApplicationHelper::cookie_id_to_int(::ApplicationHelper::get_cookie_id(cookies)) % NUM_SITES)

    # make full URL
    @new_site_url = request.base_url + "/sites/" + new_site_id.to_s

    # do a redirect
    redirect_to(@new_site_url)
  end
end
