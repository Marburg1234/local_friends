require 'base64'
require 'json'
require 'net/https'
require "google/cloud/translate"

module Vision
  class << self
    def get_image_data(image_file)
      # APIのURL作成(自分のAPIキーを埋め込んでAPI通信が使えるようにしている)
      api_url = "https://vision.googleapis.com/v1/images:annotate?key=#{ENV['Google_Vision_API']}"

      # 画像をbase64にエンコード(Base64形式のデータに変換する)
      base64_image = Base64.encode64(image_file.tempfile.read)

      # APIリクエスト用のJSONパラメータ(Base64形式のデータをJSON形式に変換する)
      # 画像データ(jpegなど) → Base64形式 → JSON形式が必要
      params = {
        requests: [{
          image: {
            content: base64_image
          },
          features: [
            {
              type: 'LABEL_DETECTION'
            }
          ]
        }]
      }.to_json

      # Google Cloud Vision APIにリクエスト送信する処理
      uri = URI.parse(api_url)
      https = Net::HTTP.new(uri.host, uri.port)
      https.use_ssl = true
      request = Net::HTTP::Post.new(uri.request_uri)
      request['Content-Type'] = 'application/json'
      response = https.request(request, params)
      response_body = JSON.parse(response.body)
      # APIレスポンス出力
      if (error = response_body['responses'][0]['error']).present?
        raise error['message']
      else
        response_body['responses'][0]['labelAnnotations'].pluck('description').take(3)
      end
    end
  end
end