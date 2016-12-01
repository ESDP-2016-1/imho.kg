module MainHelper

  def helper_execute_modals(data)
    return unless data[:modal]

    html=String.new
    modal_id=String.new

    if data[:modal].class == String
      case data[:modal]
        when 'sign_in'
          modal_id='sign_in_modal'
        when 'register'
          modal_id='sign_up_modal'
        when 'recovery'
          modal_id='recovery_modal'
        when 'recovery_new_password'
          modal_id='recovery_new_password_modal'
        else
      end
      javascript_tag("$('##{modal_id}').modal({show:true});")

    elsif data[:modal].calss==Hash


    end

  end

end
