module Web
  module Views
    class ApplicationLayout
      include Web::Layout
      include Lotus::Assets::Helpers

      def year
        Date.today.strftime('%Y')
      end

      def author
        'Ben Paddock'
      end
    end
  end
end
