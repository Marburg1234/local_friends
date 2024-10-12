module Public::ChatsHelper

  # サニタイズを行い、テキスト内のURLをリンクに変換するメソッドを作成
  def auto_link(text)
    # まず、テキストをHTMLサニタイズして、悪意のあるコードを排除
    sanitized_text = sanitize(text)

    # 正規表現を使ってURLをリンクに変換
    # URI.regexp(%w[http https]):urlのhttpやhttpsを検出する
    # gsub() <a href~>: 検出したurlをaタグ(リンク)へ変換する
    sanitized_text.gsub(URI.regexp(%w[http https])) do |url|
      # リンク化して返す
      # target='_blank':リンクを新しいタブで開くオプション
      # rel='noopener':セキュリティ強化のためのオプション
      "<a href='#{url}' target='_blank' rel='noopener'>#{url}</a>"
    end.html_safe
  end


end
