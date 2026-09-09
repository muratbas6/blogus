# Kullanılan her etiket için /tags/<etiket>/ sayfasını otomatik üretir.
# Elle dosya açmaya gerek kalmasın diye; yeni bir etiket kullanıldığında
# sayfası kendiliğinden oluşur.
module Jekyll
  class TagPage < PageWithoutAFile
    def initialize(site, tag)
      super(site, site.source, File.join("tags", tag), "index.html")
      data["layout"] = "tag"
      data["title"] = tag
    end
  end

  class TagPageGenerator < Generator
    safe true

    def generate(site)
      site.tags.each_key do |tag|
        site.pages << TagPage.new(site, tag)
      end
    end
  end
end
