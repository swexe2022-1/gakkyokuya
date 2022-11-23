class ApplicationController < ActionController::Base
  include LogInConcern
  include SessionsHelper
end
