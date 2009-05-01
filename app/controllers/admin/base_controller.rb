class Admin::BaseController < ApplicationController
  layout 'admin'

  before_filter :require_login

  protected

  def salt
    @@salt ||= Digest::SHA1.hexdigest("--#{Time.now.to_s}--" + File.open("#{RAILS_ROOT}/config/enki.yml").read + RAILS_ENV)
  end

  def set_content_type
    headers['Content-Type'] ||= 'text/html; charset=utf-8'
  end
end
