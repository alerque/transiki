class SiteController < ApplicationController  
  before_filter :authorize, :only => [:index]

end
