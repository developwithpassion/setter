module Setter
  def set(receiver, name=nil)
    set_attributes(receiver) unless name
    set_attribute(receiver, name) if name
  end

  def set_attributes(receiver)
    receiver.class.settings.each do |name|
      set_attribute receiver, name
    end
  end

  def set_attribute(receiver, name)
    receiver.send :"#{setting}=", (send name) if respond_to?(name)
  end
end
