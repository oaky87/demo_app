class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index #corresponde a la pagina
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show #corresponde a la pagina
  end

  # GET /users/new
  def new
    @user = User.new #corresponde a la pagina new.html.erb
    #(Pso 3 del flujo), which asks the User model to retrieve a list of all the users from the database (Step 4),
    #and then places them in the variable @users (pronounced “at-users”)
  end

  # GET /users/1/edit
  def edit #corresponde a la pagina
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params) #le pasa parametros
=begin
el proposito de los actions create, update, destroy; es el de modificar informacion de los users en la BdD      
=end

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email)
    end
end
