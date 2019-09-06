class <%= plural_table_name.camelize  %>Controller < ApplicationController
  before_action :set_<%= singular_table_name %>, only: [:show, :edit, :update, :destroy]
  before_action :authorization_base
  has_scope :q

  # GET /<%= plural_table_name.downcase %>
  def index
    @pagy, @<%= plural_table_name %> = pagy(apply_scopes(policy_scope(<%= singular_table_name.camelize %>)), items: 10)
  end

  # GET /<%= plural_table_name.downcase %>/1
  def show
  end

  # GET /<%= plural_table_name.downcase %>/new
  def new
    @<%= singular_table_name %> = <%= singular_table_name.camelize %>.new
  end

  # GET /<%= plural_table_name.downcase %>/1/edit
  def edit
  end

  # POST /<%= plural_table_name.downcase %>
  def create
    @<%= singular_table_name %> = <%= singular_table_name.camelize %>.new(permitted_attributes(<%= singular_table_name.camelize %>))
    if @<%= singular_table_name %>.save
      redirect_to @<%= singular_table_name %>, notice: '<%= "#{singular_table_name.camelize}" %> foi criado com sucesso!.'
    else
      render :new
    end
  end

  # PATCH/PUT /<%= plural_table_name.downcase %>/1/edit
  def update
    if @<%= singular_table_name %>.update(permitted_attributes(@<%= singular_table_name %>))
      redirect_to @<%= singular_table_name %>, notice: '<%= "#{singular_table_name.camelize}" %> foi criado com sucesso!.'
    else
      render :edit
    end
  end

  # DELETE /<%= plural_table_name.downcase %>/1/
  def destroy
    @<%= singular_table_name.downcase %>.destroy
    redirect_to <%= plural_table_name.downcase %>_url, notice: '<%= singular_table_name.camelize %> foi removido com sucesso!.'
  end

  private
  
  def authorization_base
    authorize <%= singular_table_name.camelize %>
  end

  def set_<%= singular_table_name %>
    @<%= singular_table_name %> ||= <%= singular_table_name.camelize %>.find(params[:id])
  end
end
