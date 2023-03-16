Rack::MiniProfiler.config.position = 'bottom-right'

if defined?(Rack::MiniProfiler)
  Rack::MiniProfiler.config.auto_inject = false
end
