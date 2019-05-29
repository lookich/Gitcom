module Api::V1::Support::GetJson
  def get_json
    response = RestClient.get "https://api.github.com/repos/#{params[:gitcommit][:owner]}/#{params[:gitcommit][:repo]}/commits"
    @hash = JSON.parse(response.body)
  end
end
