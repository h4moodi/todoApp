module Todo 
  class ApplicationWindow < Gtk::ApplicationWindow
    type_register

    class << self 
      def init
        set_template resource: '/com/h4ma/gtk-todo/ui/application_window.ui'
        bind_template_child 'add_new_item_button'
        bind_template_child 'todo_items_list_box'
      end
    end
    def load_todo_items
      todo_items_list_box.children.each { |child| todo_items_list_box.remove child }

      json_files = Dir[File.join(File.expand_path(application.user_data_path), '*.json')]
      items = json_files.map{ |filename| Todo::Item.new(filename: filename) }

      items.each do |item|
        todo_items_list_box.add Todo::ItemListBoxRow.new(item)
      end
    end
    def initialize(application)
      super application: application
      
      # 1. Store the incoming application argument here
      @application = application
      set_title 'GTK+ Simple ToDo'

      # 2. Only accept the ONE argument (button) that the signal actually sends
      add_new_item_button.signal_connect 'clicked' do |button|
        # 3. Use the instance variable @application here instead
        new_item_window = NewItemWindow.new(@application, Todo::Item.new(user_data_path: @application.user_data_path))
        new_item_window.present
      end
      load_todo_items
    end
  end
end