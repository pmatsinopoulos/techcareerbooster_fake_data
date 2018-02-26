module ApplicationHelper

  def paginate(objects, options = {})
    options.reverse_merge!(theme: 'twitter-bootstrap-3')

    super
  end

  def bootstrap_class_for(flash_type)
    flash_type = flash_type.to_sym
    case flash_type
      when :success
        "alert-success"
      when :error
        "alert-error"
      when :alert
        "alert-block"
      when :notice
        "alert-info"
      else
        flash_type.to_s
    end
  end
end
