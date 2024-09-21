class Public::RegionsController < ApplicationController

  # 地図の処理するためのデータを抽出するアクション これをjsonデータ形式に変換してJSに渡す
  def show
    respond_to do |format|
      format.json do
        @region = Region.find(params[:id])
      end
    end
  end

end
