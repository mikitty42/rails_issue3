module ApplicationHelper
    def choose_new _or_edit
        if action_name == 'new' || action_name == 'create'
            confirm_pictures_path
        elsif action_name == 'edit'
            picture_path
        end
    end
end
