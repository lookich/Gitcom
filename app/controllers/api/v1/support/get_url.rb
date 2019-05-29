module Api::V1::Support::GetUrl
  def get_url
      @hash.each do |item|
        url = "#{item['commit']['url']}"
        uri = url.split('https://api.github.com/').last
        uii = uri.to_s.split('/').map { |s| s.to_s }
      @gitcommit.commit_url = "https://github.com/#{uii[1]}/#{uii[2]}/archive/#{uii[5]}.zip"
    end
  end
end
