require 'base64'
require 'json'
require 'net/https'

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
              type: 'SAFE_SEARCH_DETECTION' #機能の種類を指定
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
        # response_body['responses'][0]['labelAnnotations'].pluck('description').take(3)

        # SAFE_SEARCH_DETECTIONの結果を取得
        safe_search_result = response_body['responses'][0]['safeSearchAnnotation']
        # 結果を返す 取得する結果を選択できる 最大以下の5種類
        {
          adult: safe_search_result['adult'],             # 成人向けコンテンツ
          spoof: safe_search_result['spoof'],             # パロディ（偽装）
          medical: safe_search_result['medical'],         # 医療コンテンツ
          violence: safe_search_result['violence'],       # 暴力的コンテンツ
          racy: safe_search_result['racy']                # 卑猥なコンテンツ
        }

      end
    end
  end
end