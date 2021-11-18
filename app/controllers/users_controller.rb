class UsersController < ActionController::Base
    def sign_up
        @user = User.new
    end

    def account_verify
    
        clean_params = params.require(:user).permit(:username, :password, :mail)
        @user = User.new(clean_params)
        #清除格式

        if @user.save
            redirect_to "/"
        else
            render :"sign_up"
        end
    end

    def sign_in 
        @user = User.new
    end

    def check
        u = User.login(params[:user])
        if u
          render html: "ok"
        else
          render html: "no user"
        end
      end



end