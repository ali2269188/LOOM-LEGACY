class DashboardsController < ApplicationController
  

    def ceo
      
    end
  
    def chairman
    end
  
    def chairmen
    end
  
    def board_members
    end
  
    def directors
    end
  
    def shareholders
    end
  
    def investors
    end
  
    def cfo
    end
  
    def accountants
    end
  
    def financial_analysts
    end
  
    def hr_managers
    end
  
    def recruitment_specialists
    end
  
    def training_and_development_officers
    end
  
    def sales_managers
    end
  
    def marketing_managers
    end
  
    def sales_representatives
    end
  
    def customer_relations_managers
    end
  
    def production_managers
    end
  
    def production_planners
    end
  
    def shift_supervisors
    end
  
    def machine_operators
    end
  
    def quality_control_inspectors
    end
  
    def r_and_d_managers
    end
  
    def textile_technologists
    end
  
    def research_scientists
    end
  
    def textile_designers
    end
  
    def cad_designers
    end
  
    def pattern_makers
    end
  
    def colorists
    end
  
    def it_managers
    end
  
    def systems_administrators
    end
  
    def software_developers
    end
  
    def maintenance_managers
    end
  
    def electrical_engineers
    end
  
    def mechanical_engineers
    end
  
    def maintenance_technicians
    end
  
    def procurement_managers
    end
  
    def supply_chain_coordinators
    end
  
    def purchasing_officers
    end
  
    def logistics_managers
    end
  
    def warehouse_supervisors
    end
  
    def distribution_coordinators
    end
  
    def compliance_managers
    end
  
    def environmental_specialists
    end
  
    def safety_officers
    end
  
    def customer_service_managers
    end
  
    def order_processors
    end
  
    def customer_support_representatives
    end
  
    def inventory_controllers
    end
  
    def demand_planners
    end
  
    def office_managers
    end
  
    def administrative_assistants
    end
  
    def receptionists
    end

    def edit_user_info
      @user = current_user
    end
  
    def update_user_info
      @user = current_user
      if @user.update(user_params)
        redirect_to whatsapp_path, notice: 'Your information has been updated successfully!'
      else
        render :edit_user_info, alert: 'There was an error updating your information.'
      end
    end
  
    private
  
    def user_params
      params.require(:user).permit(:username, :date_of_birth, :full_name, :bio, :photo, :phone_number)
    end
    
  end
  
  