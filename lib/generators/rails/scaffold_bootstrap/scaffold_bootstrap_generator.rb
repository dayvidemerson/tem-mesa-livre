class Rails::ScaffoldBootstrapGenerator < Rails::Generators::ScaffoldGenerator
  source_root File.expand_path('../templates', __FILE__)
  remove_hook_for :assets

  def create_controller_file
    template "controller.rb", File.join('app/controllers', "#{plural_name}_controller.rb")
  end

  def create_index_file
    template "index.html.erb", File.join('app/views', plural_name, 'index.html.erb')
  end

  def create_edit_file
    template "edit.html.erb", File.join('app/views', plural_name, 'edit.html.erb')
  end

  def create_new_file
    template "new.html.erb", File.join('app/views', plural_name, 'new.html.erb')
  end

  def create_show_file
    template "show.html.erb", File.join('app/views', plural_name, 'show.html.erb')
  end

  def create_form_file
    template "_form.html.erb", File.join('app/views', plural_name, '_form.html.erb')
  end

  def create_policy_file
    template "policy.rb", File.join('app/policies', "#{singular_name}_policy.rb")
  end
end
