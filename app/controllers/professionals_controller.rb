class ProfessionalsController < ApplicationController
  before_action :set_professional, only: [:show, :send_me]
  before_action :authorization_base

  has_scope :with_city
  has_scope :with_state
  has_scope :with_occupation

  # GET /professionals
  def index
    @pagy, @professionals = pagy(apply_scopes(policy_scope(Professional)), items: 10)
  end

  # GET /professionals/1
  def show
  end

  # GET /professionals/profile
  def profile
    @professional = Professional.find_by_user_id(current_user.id) || Professional.new(user: current_user)
  end

  # POST/PUT/PATCH /professionals/save_profile
  def save_profile
    @professional = Professional.find_by_user_id(current_user.id) || Professional.new(user: current_user)
    @professional.assign_attributes(permitted_attributes(@professional))
    if @professional.save
      redirect_to profile_professionals_path, notice: 'Perfil atualizado com sucesso!'
    else
      render :profile
    end
  end

  # POST /professionals/1/send_me
  def send_me
    ProfessionalMailer.with(user: current_user, professional: @professional).send_me.deliver_now
    redirect_to @professional, notice: 'E-mail enviado com sucesso!'
  end

  private
  
  def authorization_base
    authorize Professional
  end

  def set_professional
    @professional ||= Professional.find(params[:id])
  end
end
