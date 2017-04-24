module ApplicationHelper
def find_user
      ret = User.find(params[:id])
      return ret
   end   
end
