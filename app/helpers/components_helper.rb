module ComponentsHelper
  def component_group_name(component)
     "#{component.group_name.blank? ? "-" : component.group_name}"
  end

  def component_model_name(component)
     "#{component.model_name.blank? ? "-" : component.model_name}"
  end

  def component_weight(component)
     "#{component.weight.blank? ? "-" : component.weight}"
  end

  def component_info(component)
    component_info = "#{component.manufacturer}" 
    component_info << " #{component.model_name}" unless component.model_name.blank?
    component_info << ", #{component.group_name}" unless component.group_name.blank?
    return component_info
  end

end
