class Backoffice::AdminsController < BackofficeController
  
  before_action :set_admin, only: [:edit, :update, :destroy]
  
  def index
    @administradores = Admin.all
  end
  
  def new
    @administrador = Admin.new
  end

  def create  
    @administrador = Admin.new(params_admin)
    if @administrador.save 
      redirect_to backoffice_admins_path, notice: "Administrador (#{@administrador.email}) foi criado com sucesso"
    else
      render :new
    end
  end
  
  def edit
  end
  
  def update
    passwrd = params[:admin][:password]
    passwrd_conf = params[:admin][:password_confirmation]
    
    if passwrd.blank? && passwrd_conf.blank?
      params[:admin].delete(:password)
      params[:admin].delete(:password_confirmation)
    end 
    
    if @administrador.update(params_admin)
      redirect_to backoffice_admins_path, notice: "Dados do Administrador (#{@administrador.email}) foi atualizada com sucesso"
    else
      render :edit
    end
  end
  
  def destroy
    admin_email = @administrador.email
     
    if @administrador.destroy
      redirect_to backoffice_admins_path, notice: "Administrador (#{admin_email}) foi excluido com sucesso"
    else
      render :index
    end
  end
  
  private
  
  def set_admin
      @administrador = Admin.find(params[:id])
  end
  
  def params_admin
    params.require(:admin).permit(:name, :email,:password,:password_confirmation)
  end
  
end
