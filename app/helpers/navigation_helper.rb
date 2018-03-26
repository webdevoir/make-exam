module NavigationHelper
    def current_location?(*args)
        options = args.extract_options!
        options.each do |key, val|
            return false unless eval("controller.#{key.to_s}_name") == val
        end
        true
    end
end