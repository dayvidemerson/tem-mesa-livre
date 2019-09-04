class PlacesController < ApplicationController
  before_action :set_place, only: [:show, :edit, :update, :destroy]
  before_action :authorization_base
  has_scope :q

  # GET /places
  def index
    @pagy, @places = pagy(apply_scopes(policy_scope(Place)), items: 10)
  end

  # GET /places/1
  def show
  end

  # GET /places/new
  def new
    @place = Place.new
  end

  # GET /places/1/edit
  def edit
  end

  # POST /places
  def create
    @place = Place.new(permitted_attributes(Place))
    if @place.save
      redirect_to @place, notice: '@place foi criado com sucesso!.'
    else
      render :new
    end
  end

  # PATCH/PUT /places/1/edit
  def update
    if @place.update(permitted_attributes(@place))
      redirect_to @place, notice: '@place foi criado com sucesso!.'
    else
      render :edit
    end
  end

  def destroy
    @place.destroy
    redirect_to places_url, notice: 'Place foi removido com sucesso!.'
  end

  private
  
  def authorization_base
    authorize Place, :index?
  end

  def set_place
    @place ||= Place.find(params[:id])
  end
end
