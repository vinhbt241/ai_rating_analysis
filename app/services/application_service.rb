class ApplicationService
  def call
    raise NoMethodError
  end

  def self.call(*args, **kwargs, &block)
    new(*args, **kwargs, &block).call
  end
end
