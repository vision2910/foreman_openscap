class ScaptimonyPoliciesController < ApplicationController
  include Foreman::Controller::AutoCompleteSearch
  before_filter :find_by_id, :only => [:edit, :update]

  def model_of_controller
    ::Scaptimony::Policy
  end

  # GET /scaptimony_policies
  def index
    @policies = resource_base.search_for(params[:search])
  end

  def new
    @policy = ::Scaptimony::Policy.new
  end

  def create
    @policy = ::Scaptimony::Policy.new(params[:policy])
    if @policy.save
      process_success
    else
      process_error
    end
  end

  def update
    if @policy.update_attributes(params[:policy])
      process_success
    else
      process_error
    end
  end

  private
  def find_by_id
    @policy = resource_base.find(params[:id])
  end
end