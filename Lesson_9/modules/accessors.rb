# acessors
module Accessors
  def self.included(base)
    base.extend ClassMethods
  end

  # ClassMethods
  module ClassMethods
    def attr_accessor_with_history(*args)
      args.each do |name|
        arg     = "@#{name}".to_sym
        history = "@#{name}_history".to_sym

        define_method(name) { instance_variable_get(arg) }
        define_method("#{name}_history") { instance_variable_get(history) || [] }

        define_method("#{name}=") do |value|
          history_value = send("#{name}_history").push(send(name))
          instance_variable_set(history, history_value)

          instance_variable_set(arg, value)
        end
      end
    end

    def strong_attr_accessor(name, type)
      arg = "@#{name}".to_sym
      define_method(name) { instance_variable_get(arg) }

      define_method("#{name}=") do |value|
        value.is_a?(type) ? instance_variable_set(arg, value) : raise("Ошибка в типе: #{arg}")
      end
    end
  end
end
