class SecretCodesController < ApplicationController
  before_action :set_secret_code, only: [:show, :edit, :update, :destroy]

  # GET /secret_codes
  # GET /secret_codes.json
  def index
    @secret_codes = SecretCode.all
    if params[:unutilized] == "true"
      @secret_codes = @secret_codes.where(user_id: nil)
    end  
    render :json => @secret_codes, :status => :ok
  end

  # GET /secret_codes/1
  # GET /secret_codes/1.json
  def show
  end

  # GET /secret_codes/new
  def new
    @secret_code = SecretCode.new
  end

  # GET /secret_codes/1/edit
  def edit
  end

  # POST /secret_codes
  # POST /secret_codes.json

  def secret_code_create
    count = params[:count].to_i
    count.times {SecretCode.create(name:  [*('a'..'z')].sample(8).join)}
    render json: {}, :status => :ok 
  end 

  def create
    @secret_code = SecretCode.new(secret_code_params)

    respond_to do |format|
      if @secret_code.save
        format.html { redirect_to @secret_code, notice: 'Secret code was successfully created.' }
        format.json { render :show, status: :created, location: @secret_code }
      else
        format.html { render :new }
        format.json { render json: @secret_code.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /secret_codes/1
  # PATCH/PUT /secret_codes/1.json
  def update
    secret_code = SecretCode.where(name: params[:secret_code][:name]).last
    secret_code.update_attributes(user_id: params[:secret_code][:user_id])
    render :json => secret_code, :status => :ok
  end

  # DELETE /secret_codes/1
  # DELETE /secret_codes/1.json
  def destroy
    @secret_code.destroy
    respond_to do |format|
      format.html { redirect_to secret_codes_url, notice: 'Secret code was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_secret_code
      @secret_code = SecretCode.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def secret_code_params
      params.fetch(:secret_code, {})
    end
end
