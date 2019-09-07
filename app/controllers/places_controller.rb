class PlacesController < ApplicationController
  before_action :set_place, only: [:show, :edit, :update, :destroy]
  before_action :authorization_base
  
  has_scope :with_city
  has_scope :with_state
  has_scope :with_occupation
  has_scope :min_price
  has_scope :max_price
  has_scope :min_date
  has_scope :max_date

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
      redirect_to @place, notice: 'Place foi criado com sucesso!.'
    else
      render :new
    end
  end

  # PATCH/PUT /places/1/edit
  def update
    if @place.update(permitted_attributes(@place))
      redirect_to @place, notice: 'Place foi criado com sucesso!.'
    else
      render :edit
    end
  end

  # DELETE /places/1
  def destroy
    @place.destroy
    redirect_to places_url, notice: 'Place foi removido com sucesso!.'
  end

  # POST /places/1/send_me
  def send_me
    PlaceMailer.with(user: current_user, place: @place).send_me.deliver_now
    redirect_to @place, notice: 'E-mail enviado com sucesso!'
  end

  private
  
  def authorization_base
    authorize Place
  end

  def set_place
    @place ||= Place.find(params[:id])
  end
end
