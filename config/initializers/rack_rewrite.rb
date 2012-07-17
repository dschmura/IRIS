Iris::Application.config.middleware.insert_before(Rack::Lock, Rack::Rewrite) do



end
